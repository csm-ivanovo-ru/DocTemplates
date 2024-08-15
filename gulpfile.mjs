// Copyright 2024 Sergei S. Betke

import path from 'node:path';
import url from 'node:url';
import streamBuffers from 'stream-buffers';
import { series, parallel, task, src, dest } from 'gulp';
import logger from 'gulplog';
import rename from 'gulp-rename';
import newer from 'gulp-newer';
import Vinyl from 'vinyl';
import sharp from 'sharp';
import through2 from 'through2';
import { versionFromGitTag } from 'absolute-version';
import SaxonJS from 'saxon-js';
import ini from 'ini';
import QRCode from 'qrcode';

//#region вычисление версии
if (process.env.version) {
	const version = process.env.version;
} else {
	const version = versionFromGitTag({ tagGlob: '[0-9]*' });
};
//#endregion вычисление версии

//#region пути
const markerFileName = '.dirstate';
const repoRootPath = path.resolve('./');

const sourcePath = path.join(repoRootPath, 'src');
const sourceURIsPath = path.join(sourcePath, 'QRCodes/URIs');
const sourceXCardPath = path.join(sourcePath, 'QRCodes/xCards');
const sourceLibrariesPath = path.join(sourcePath, 'basic');
const sourceTemplatesPath = path.join(sourcePath, 'template');
const sourceDocumentsPath = path.join(sourcePath, 'doc');

const imagesPath = path.join(sourcePath, 'images');
const imagesPNGPath = path.join(imagesPath, 'png');

const russiaEmblemPath = path.join(imagesPath, 'svg/russian-emblems');
const orgLogoPath = path.join(imagesPath, 'svg/org-logo');

const destinationImagesPath = imagesPNGPath;

const sourceORDTemplatePath = path.join(sourceTemplatesPath, 'ОРД ФБУ Ивановский ЦСМ v3.ott');

const tempPath = path.join(repoRootPath, 'tmp');

const destinationVCardPath = path.join(tempPath, 'vCards');
const destinationQRCodesPath = path.join(tempPath, 'QRCodes');
const destinationQRCodesURIPath = path.join(destinationQRCodesPath, 'URIs');
const destinationQRCodesVCardPath = path.join(destinationQRCodesPath, 'vCards');

const destinationLibContainersPath = path.join(tempPath, 'basic');
const preprocessedTemplatesPath = path.join(tempPath, 'template');
const preprocessedDocumentsPath = path.join(tempPath, 'doc');

const tempDocsToolsPath = path.join(tempPath, 'docs');
const tempDocsXSLTToolsPath = path.join(tempDocsToolsPath, 'xslt');

const destinationPath = path.join(repoRootPath, 'output');
const destinationLibrariesPath = path.join(destinationPath, 'basic');
const destinationTemplatesPath = path.join(destinationPath, 'template');
const destinationDocumentsPath = path.join(destinationPath, 'doc');

const templatesFilter = '*.ott';
const documentsFilter = '*.odt';

const testsPath = path.join(repoRootPath, 'tests');

const toolsPath = path.join(repoRootPath, 'tools');
const XSLTToolsPath = path.join(toolsPath, 'xslt');
const DocsToolsPath = path.join(toolsPath, 'docs');
const DocsXSLTToolsPath = path.join(DocsToolsPath, 'xslt');
//#endregion пути

//#region подготовка изображений

function getBuildPNGTask(SVGPath, PNGBasename) {
	const taskName = 'convertImage:' + PNGBasename;
	const PNGPath = path.join(destinationImagesPath, PNGBasename);
	task(
		taskName,
		function () {
			return src(SVGPath, { encoding: false })
				.pipe(newer({
					dest: destinationImagesPath,
					map: function () { return PNGBasename; }
				}))
				.pipe(through2.obj(
					function (file, encoding, cb) {
						sharp(
							file.contents,
							{
								density: 600,
								ignoreIcc: true
							}
						)
							.resize({ width: 600 })
							.toColorspace('b-w')
							.png({
								compressionLevel: 9,
								colors: 2
							})
							.toBuffer()
							.then((imageBuffer) => {
								var newFile = new Vinyl({
									cwd: file.cwd,
									path: PNGBasename,
									contents: imageBuffer
								});
								this.push(newFile);
								cb();
							})
					}
				))
				.pipe(dest(destinationImagesPath))
		}
	);
	return taskName;
}

task('build:images',
	parallel(
		getBuildPNGTask(path.join(orgLogoPath, '*.svg'), 'org-logo.png'),
		getBuildPNGTask(path.join(russiaEmblemPath, 'emblem_black_bordered.svg'), 'russian_emblem.png')
	)
);

function getImageCopyToDocumentTask(pictureBasename, docFolderPath) {
	const taskName = 'copy:imageToDocument:' + pictureBasename;
	task(
		taskName,
		function () {
			return src(
				path.join(destinationImagesPath, pictureBasename),
				{ encoding: false }
			)
				.pipe(newer(docFolderPath))
				.pipe(dest(docFolderPath))
		}
	);
	return taskName;
}

//#endregion подготовка изображений

//#region подготовка QR-кодов для URL

task('build:URL-QRCodes', function () {
	return src(path.join(sourceURIsPath, '*.url'), { encoding: false })
		.pipe(newer({
			dest: destinationImagesPath,
			ext: '.png'
		}))
		.pipe(through2.obj(function (file, encoding, callback) {
			const urlFileContent = ini.parse(file.contents.toString());
			const urlForQRCode = new URL(
				ini.parse(file.contents.toString())
					.InternetShortcut.URL
			);
			var PNGStream = new streamBuffers.WritableStreamBuffer()
				.on('close', () => {
					var newFile = file.clone();
					newFile.extname = '.png';
					newFile.contents = PNGStream.getContents();
					this.push(newFile);
					callback();
				});
			QRCode.toFileStream(PNGStream, urlForQRCode.toString(), { type: 'png', scale: 1, });
		}))
		.pipe(dest(destinationImagesPath));
});

//#endregion подготовка QR-кодов для URL

//#region компиляция XSLT


//#endregion компиляция XSLT

//#region сборка шаблона

// получаем список изображений из манифеста шаблона

const sourceORDTemplateSrcPath = path.join(sourceORDTemplatePath, 'src');

const ORDTemplateMetaXML = await SaxonJS.getResource({
	file: path.join(sourceORDTemplateSrcPath, 'META-INF/manifest.xml'),
	type: "xml"
});
const ORDTemplatePicturesPaths = SaxonJS.XPath.evaluate(
	`/manifest:manifest/manifest:file-entry[
		@manifest:media-type='image/png'
		and starts-with(@manifest:full-path, 'Pictures/')
	]/@manifest:full-path/string()`,
	ORDTemplateMetaXML,
	{
		namespaceContext: {
			manifest: 'urn:oasis:names:tc:opendocument:xmlns:manifest:1.0'
		},
		resultForm: 'array'
	}
);
logger.debug('Template pictures (from meta information):');
logger.debug(ORDTemplatePicturesPaths);

task('build:template:ORD',
	series(
		parallel(
			'build:images',
			'build:URL-QRCodes'
		),
		parallel(
			ORDTemplatePicturesPaths.map((picturePath) => {
				return getImageCopyToDocumentTask(
					path.basename(picturePath),
					path.join(sourceORDTemplateSrcPath, 'Pictures')
				);
			})
		)
	)
);

const _buildTemplates = parallel(
	'build:template:ORD'
);
export { _buildTemplates as buildTemplates };

//#endregion сборка шаблона

//#region основные задачи
task('build',
	parallel(
		'build:template:ORD'
	)
);

task('clean',
	function clean(cb) {
		cb();
	}
);

task('distclean',
	series(
		'clean'
	)
);

task('maintainer-clean',
	series(
		'clean'
	)
);

const _default = series(
	'build'
);
export { _default as default };
//#endregion основные задачи
