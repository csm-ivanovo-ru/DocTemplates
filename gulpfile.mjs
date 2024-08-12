// Copyright 2024 Sergei S. Betke

import { series, parallel, task, src, dest } from 'gulp';
import logger from 'gulplog';
import rename from 'gulp-rename';
import newer from 'gulp-newer';
import Vinyl from 'vinyl';
import sharp from 'sharp';
import through2 from 'through2';
import path from 'node:path';
import replaceExt from 'replace-ext';
import { versionFromGitTag } from 'absolute-version';

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

const destinationPath = path.join(repoRootPath, 'output');
const destinationLibrariesPath = path.join(destinationPath, 'basic');
const destinationTemplatesPath = path.join(destinationPath, 'template');
const destinationDocumentsPath = path.join(destinationPath, 'doc');

const templatesFilter = '*.ott';
const documentsFilter = '*.odt';

const testsPath = path.join(repoRootPath, 'tests');

const toolsPath = path.join(repoRootPath, 'tools');
const XSLTToolsPath = path.join(toolsPath, 'xslt');
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
					async function (file, _, cb) {
						try {
							const imageBuffer = await sharp(
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
								.toBuffer();
							var newFile = new Vinyl({
								cwd: file.cwd,
								path: PNGBasename,
								contents: imageBuffer
							});
							return cb(null, newFile);
						} catch (err) {
							console.error(err);
							return cb(null, file);
						}
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

// TODO: в дальнейшем копировать изображения из destinationImagesPath
// исключительно на основании XML манифеста шаблона

function getTempImagesCopyToDocumentTask(pictureBasename, docFolderPath) {
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

//#region сборка шаблона

const picturesDirname = path.join(sourceORDTemplatePath, 'src/Pictures');

task('build:template:ORD',
	series(
		'build:images',
		parallel(
			getTempImagesCopyToDocumentTask('org-logo.png', picturesDirname),
			getTempImagesCopyToDocumentTask('russian_emblem.png', picturesDirname)
		)
	)
);

const _buildTemplates = parallel(
	'build:template:ORD'
);
export { _buildTemplates as buildTemplates };

//#endregion сборка шаблона

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
