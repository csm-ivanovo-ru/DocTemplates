// Copyright 2024 Sergei S. Betke

import path from 'node:path';
import url from 'node:url';
import streamBuffers from 'stream-buffers';
import { series, parallel, task, src, dest } from 'gulp';
import logger from 'gulplog';
import newer from 'gulp-newer';
import rename from 'gulp-rename';
import transform from '@lumjs/gulp-transform';
import clean from 'gulp-clean';
import filter from 'gulp-filter';
import vinylPaths from 'vinyl-paths';
import sharp from 'sharp';
import through from 'through2';
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
// const repoRootPath = path.resolve('./');
const repoRootPath = '.';

const sourcePath = path.join(repoRootPath, 'src');
const sourceURIsPath = path.join(sourcePath, 'QRCodes/URIs');
const sourceXCardPath = path.join(sourcePath, 'QRCodes/xCards');
const sourceLibrariesPath = path.join(sourcePath, 'basic');
const sourceTemplatesPath = path.join(sourcePath, 'template');
const sourceDocumentsPath = path.join(sourcePath, 'doc');

const imagesPath = path.join(sourcePath, 'images');
const imagesPNGPath = path.join(imagesPath, 'png');

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

const imagesConfig = {
	SVGPath: path.join(imagesPath, 'svg'),
	PNGPath: imagesPNGPath
};

task('build:images:SVG2PNG',
	function () {
		return src(
			path.join(imagesConfig.SVGPath, '*.svg'),
			{ encoding: false }
		)
			.pipe(newer({ dest: imagesConfig.PNGPath }))
			.pipe(transform((content, file) => {
				return sharp(
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
			}))
			.pipe(rename({ extname: '.png' }))
			.pipe(dest(imagesConfig.PNGPath))
	}
);

task('build:images:russian_emblem.svg',
	function () {
		return src(path.join(imagesPath, 'russian-emblems/emblem_black_bordered.svg'), { encoding: false })
			.pipe(newer({
				dest: imagesConfig.SVGPath,
				map: () => 'russian_emblem.svg'
			}))
			.pipe(rename({ basename: 'russian_emblem' }))
			.pipe(dest(imagesConfig.SVGPath))
	}
);

task('build:images',
	series(
		'build:images:russian_emblem.svg',
		'build:images:SVG2PNG'
	)
);

//#endregion подготовка изображений

//#region подготовка QR-кодов для URL

const URI_QRCodesConfig = {
	URLPath: sourceURIsPath,
	URLSrc: path.join(sourceURIsPath, '*.url'),
	QRCodesPath: destinationImagesPath,
	extname: '.png',
	imageConfig: {
		type: 'png',
		scale: 1
	}
};

task('build:URL-QRCodes', function () {
	return src(URI_QRCodesConfig.URLSrc, { encoding: 'utf8' })
		.pipe(newer({
			dest: URI_QRCodesConfig.QRCodesPath,
			ext: URI_QRCodesConfig.extname
		}))
		.pipe(transform((content, _) => {
			return new Promise((resolve, reject) => {
				const urlForQRCode = new URL(ini.parse(content.toString('utf8')).InternetShortcut.URL);
				let PNGStream = new streamBuffers.WritableStreamBuffer()
					.on('finish', () => { resolve(PNGStream.getContents()) });
				QRCode.toFileStream(PNGStream, urlForQRCode.toString(), URI_QRCodesConfig.imageConfig);
			})
		}))
		.pipe(rename({ extname: URI_QRCodesConfig.extname }))
		.pipe(dest(URI_QRCodesConfig.QRCodesPath))
});

task('maintainer-clean:URL-QRCodes',
	function () {
		return src(URI_QRCodesConfig.URLSrc, { read: false, allowEmpty: true, base: process.cwd() })
			.pipe(rename({
				dirname: URI_QRCodesConfig.QRCodesPath,
				extname: URI_QRCodesConfig.extname
			}))
			.pipe(clean())
	}
);

//#endregion подготовка QR-кодов для URL

//#region компиляция XSLT


//#endregion компиляция XSLT

//#region сборка шаблона

// получаем список изображений из манифеста шаблона

const sourceORDTemplateSrcPath = path.join(sourceORDTemplatePath, 'src');

task(
	'build:template:ORD:Pictures',
	() => {
		const picturesPath = path.join(sourceORDTemplateSrcPath, 'Pictures');
		return src(path.join(sourceORDTemplateSrcPath, 'META-INF/manifest.xml'), { encoding: false })
			.pipe(through.obj(function (file, _, cb) {

				var self = this;

				SaxonJS.getResource({ file: file.path, type: 'xml' })
					.then((manifest) => {
						return SaxonJS.XPath.evaluate(
							`/manifest:manifest/manifest:file-entry[
										( @manifest:media-type='image/png' or @manifest:media-type='image/svg+xml' )
										and starts-with(@manifest:full-path, 'Pictures/')
									]/@manifest:full-path/string()`,
							manifest,
							{
								namespaceContext: {
									manifest: 'urn:oasis:names:tc:opendocument:xmlns:manifest:1.0'
								},
								resultForm: 'array'
							}
						)
							.map((docPicturePath) => '**/' + path.basename(docPicturePath));
					})
					.then((docPictures) => {
						// src(PNGImagesGlob, { encoding: false })
						src([
							path.join(imagesConfig.SVGPath, '*.svg'),
							path.join(imagesConfig.PNGPath, '*.png')
						], {
							encoding: false
						})
							.pipe(filter(docPictures))
							.on('end', cb)
							.on('error', cb)
							.on('data', (file) => { self.push(file); });
					});

			}))
			.pipe(newer(picturesPath))
			.pipe(dest(picturesPath))
	}
);

task('build:template:ORD',
	series(
		parallel(
			'build:images',
			'build:URL-QRCodes'
		),
		'build:template:ORD:Pictures'
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
		'clean',
		parallel(
			'maintainer-clean:URL-QRCodes'
		)
	)
);

const _default = series(
	'build'
);
export { _default as default };
//#endregion основные задачи
