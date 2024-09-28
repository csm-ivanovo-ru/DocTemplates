// Copyright 2024 Sergei S. Betke

import path from 'node:path';
import url from 'node:url';
import { spawn } from 'node:child_process';
import streamBuffers from 'stream-buffers';
import { series, parallel, task, src, dest } from 'gulp';
import logger from 'gulplog';
import newer from 'gulp-newer';
import rename from 'gulp-rename';
import transform from '@lumjs/gulp-transform';
import clean from 'gulp-clean';
import filter from 'gulp-filter';
import tmp from 'tmp-promise'
import sharp from 'sharp';
import svgMin from 'gulp-svgmin';
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

task('build:images:URL-QRCodes', function () {
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

//#region подготовка изображений

const imagesConfig = {
	SVGPath: path.join(imagesPath, 'svg'),
	PNGPath: imagesPNGPath,
	preprocessedPath: path.join(tempPath, 'images')
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

task('build:images:preprocessing:PNG',
	function () {
		return src(path.join(imagesConfig.PNGPath, '*.png'), { encoding: false })
			.pipe(newer({ dest: imagesConfig.preprocessedPath }))
			.pipe(dest(imagesConfig.preprocessedPath))
	}
);

task('build:images:preprocessing:SVG',
	function () {
		return src(path.join(imagesConfig.SVGPath, '*.svg'), { encoding: false })
			.pipe(newer({ dest: imagesConfig.preprocessedPath }))
			.pipe(svgMin((file) => {
				if (path.matchesGlob(file.basename, 'russian_emblem.svg')) {
					return {};
				} else {
					return {
						floatPrecision: 0
					}
				}
			}))
			.pipe(dest(imagesConfig.preprocessedPath))
	}
);

task('build:images',
	series(
		'build:images:russian_emblem.svg',
		parallel(
			series(
				parallel(
					'build:images:SVG2PNG',
					'build:images:URL-QRCodes'
				),
				'build:images:preprocessing:PNG'
			),
			'build:images:preprocessing:SVG'
		)
	)
);

task('clean:images',
	function () {
		return src(path.join(imagesConfig.preprocessedPath, '*.*'), { read: false, allowEmpty: true })
			.pipe(clean())
	}
);

//#endregion подготовка изображений

//#region компиляция XSLT

const XSLTConfig = {
	XSLTPath: path.join(toolsPath, 'docs/xslt-js/xslt'),
	SEFPath: path.join(toolsPath, 'docs/xslt-js/sef'),
	SEFExtName: '.sef.json'
};

task('build:tools:XSLT:SEF',
	function () {
		return src(path.join(XSLTConfig.XSLTPath, '*.xslt'), { read: false })
			.pipe(newer({
				dest: XSLTConfig.SEFPath,
				ext: XSLTConfig.SEFExtName
			}))
			.pipe(through.obj(function (file, _, cb) {
				var self = this;

				tmp.withDir(
					(SEFTempDir) => {
						return new Promise((resolve, reject) => {
							let SEFTempFilePath = path.join(SEFTempDir.path, path.basename(file.path));
							logger.debug(`SEF temp file path: ${SEFTempFilePath}`);
							// https://www.saxonica.com/saxon-js/documentation2/index.html#!starting/export/compiling-using-XX
							spawn(
								'xslt3',
								[
									`-xsl:"${file.path}"`,
									`-export:"${SEFTempFilePath}"`,
									'-nogo',
									'-relocate:on'
								],
								{
									shell: true,
									stdio: 'inherit',
									windowsHide: true,
									timeout: 60000,
									windowsVerbatimArguments: true
								}
							)
								.on('error', reject)
								.on('error', cb)
								.on('close', (exitCode, _) => {
									if (exitCode !== 0) {
										reject(new Error(`XSLT3 failed: ${exitCode}`));
									} else {
										src(SEFTempFilePath, { encoding: false })
											.pipe(rename({
												basename: path.parse(file.basename).name,
												extname: XSLTConfig.SEFExtName
											}))
											.on('end', resolve)
											.on('error', reject)
											.on('data', file => self.push(file));
									};
								});
						});
					},
					{ unsafeCleanup: true }
				)
					.then(_ => cb(null, _))
					.catch(cb)
			}))
			// .pipe(rename({ extname: XSLTConfig.SEFExtName }))
			.pipe(dest(XSLTConfig.SEFPath))
	});

task('distclean:tools:XSLT:SEF',
	function () {
		return src(path.join(XSLTConfig.SEFPath), { read: false, allowEmpty: true })
			.pipe(clean())
	}
);

//#endregion компиляция XSLT

//#region сборка шаблона

// получаем список изображений из манифеста шаблона

const sourceORDTemplateSrcPath = path.join(sourceORDTemplatePath, 'src');

task(
	'build:template:ORD:Pictures',
	() => {
		const picturesPath = path.join(sourceORDTemplateSrcPath, 'Pictures');
		return src(path.join(sourceORDTemplateSrcPath, 'META-INF/manifest.xml'), { read: false })
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
						src([path.join(imagesConfig.preprocessedPath, '*.*')], { encoding: false })
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
		'build:images',
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
	parallel(
		'clean:images'
	)
);

task('distclean',
	series(
		'clean',
		parallel(
			'distclean:tools:XSLT:SEF'
		)
	)
);

task('maintainer-clean',
	series(
		'distclean',
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
