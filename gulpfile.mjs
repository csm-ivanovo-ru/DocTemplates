// Copyright 2024 Sergei S. Betke

import { series, parallel, src, dest } from 'gulp';
import logger from 'gulplog';
import rename from 'gulp-rename';
import newer from 'gulp-newer';
import Vinyl from 'vinyl';
import sharp from 'sharp';
import through2 from 'through2';
import path from 'node:path';
import replaceExt from 'replace-ext';
import { versionFromGitTag } from 'absolute-version';

//#region пути
const markerFileName = '.dirstate';
const repoRootPath = path.resolve('./');

const sourcePath = path.join(repoRootPath, 'src');
const sourceURIsPath = path.join(sourcePath, 'QRCodes/URIs');
const sourceXCardPath = path.join(sourcePath, 'QRCodes/xCards');
const sourceLibrariesPath = path.join(sourcePath, 'basic');
const sourceTemplatesPath = path.join(sourcePath, 'template');
const sourceDocumentsPath = path.join(sourcePath, 'doc');

const tempPath = path.join(repoRootPath, 'tmp');

const destinationVCardPath = path.join(tempPath, 'vCards');
const destinationQRCodesPath = path.join(tempPath, 'QRCodes');
const destinationQRCodesURIPath = path.join(destinationQRCodesPath, 'URIs');
const destinationQRCodesVCardPath = path.join(destinationQRCodesPath, 'vCards');

const destinationLibContainersPath = path.join(tempPath, 'basic');
const preprocessedTemplatesPath = path.join(tempPath, 'template');
const preprocessedDocumentsPath = path.join(tempPath, 'doc');

const imagesPath = path.join(sourcePath, 'images');
const russiaEmblemPath = path.join(imagesPath, 'russian-emblems');
const orgLogoPath = path.join(imagesPath, 'org-logo');

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

if (process.env.version) {
	const version = process.env.version;
} else {
	const version = versionFromGitTag({ tagGlob: '[0-9]*' });
};

function getBuildPNGTask(SVGDirname) {
	return src(path.join(SVGDirname, '*.svg'))
		.pipe(newer({
			dest: SVGDirname,
			map: function (srcPath) {
				return replaceExt(srcPath, '.png');
			}
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
						base: file.base,
						path: file.path,
						extname: '.png',
						contents: imageBuffer
					});
					return cb(null, newFile);
				} catch (err) {
					console.error(err);
					return cb(null, file);
				}
			}
		))
		.pipe(rename({ extname: '.png' }))
		.pipe(dest(SVGDirname))
}

function buildOrgLogoPNG() {
	return getBuildPNGTask(orgLogoPath);
}

function buildRussianEmblemPNG() {
	return getBuildPNGTask(russiaEmblemPath);
}

const buildImages = parallel(
	buildOrgLogoPNG,
	buildRussianEmblemPNG
);
export { buildImages as buildImages };

function clean(cb) {
	cb();
}

const _clean = clean;
export { _clean as clean };

const _distclean = series(
	_clean
);
export { _distclean as distclean };

const _maintainerClean = series(
	_distclean
);
export { _maintainerClean as maintainerClean };

const _build = parallel(
	buildImages
);
export { _build as build };

const _default = series(
	_clean,
	_build
);
export { _default as default };
