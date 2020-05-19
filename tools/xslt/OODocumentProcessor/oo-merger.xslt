<?xml version="1.0" encoding="UTF-8"?><xsl:package version="3.0"
	id="OOMerger"
	name="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/OODocumentProcessor/oo-merger.xslt"
	package-version="1.5.0"
	declared-modes="yes"
	expand-text="no"
	input-type-annotations="strip"
	default-validation="strip"

	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:err="http://www.w3.org/2005/xqt-errors"
	xmlns:saxon="http://saxon.sf.net/"

	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"

	xmlns:f="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/formatter"
	xmlns:p="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/OODocumentProcessor"
>

	<xsl:variable name="p:dont-stop-on-empty-files" as="xs:boolean" static="yes" select="true()" visibility="private"/>

	<xsl:variable name="p:manifest-uri" as="xs:string" static="yes" select="'META-INF/manifest.xml'" visibility="private"/>

	<!--
		Сбор всех XML файлов документа в единый файл.
		Основа структуры - файл манифеста.
		Содержимое файлов включаем в элементы манифеста.
	-->
	<xsl:mode
		name="p:merge-document-files"
		on-no-match="shallow-copy" warning-on-no-match="no"
		on-multiple-match="fail" warning-on-multiple-match="yes"
		visibility="final"
	/>

	<xsl:use-package name="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/formatter/OO.xslt" package-version="1.5">
		<xsl:accept component="mode" names="f:inline" visibility="final"/>
	</xsl:use-package>

	<xsl:template mode="p:merge-document-files" match="/manifest:manifest/manifest:file-entry[
		( @manifest:media-type='text/xml' )
		or ( @manifest:media-type='application/rdf+xml' )
		or ( @manifest:media-type='' and ends-with( @manifest:full-path, '.xml' ) )
	]">
		<xsl:param name="p:document-folder-uri" as="xs:anyURI" select="resolve-uri( '..', base-uri() )" tunnel="yes"/>
		<!-- <xsl:try rollback-output="yes"> -->
			<xsl:copy>
				<xsl:apply-templates select="@*" mode="#current"/>
				<xsl:source-document href="{ iri-to-uri( resolve-uri( data( @manifest:full-path ), $p:document-folder-uri ) ) }"
					streamable="no" use-accumulators="#all" validation="strip"
				>
					<xsl:apply-templates select="." mode="f:inline"/>
				</xsl:source-document>
			</xsl:copy>
			<!-- <xsl:catch errors="SXXP0003" use-when="$p:dont-stop-on-empty-files"> -->
			<!-- <xsl:catch errors="*" use-when="$p:dont-stop-on-empty-files">
				<xsl:message terminate="no" error-code="SXXP0003" expand-text="yes">Empty XML file! Check file "{ resolve-uri( data( @manifest:full-path ), $p:document-folder-uri ) }".</xsl:message>
			</xsl:catch> -->
		<!-- </xsl:try> -->
	</xsl:template>

	<xsl:template mode="p:merge-document-files" match="/manifest:manifest/manifest:file-entry[
		@manifest:full-path = $p:manifest-uri
	]">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="#current"/>
		</xsl:copy>
	</xsl:template>

</xsl:package>