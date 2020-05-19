<?xml version="1.0" encoding="UTF-8"?><xsl:package version="3.0"
	id="OOOptimizer"
	name="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/optimizer/OOOptimizer.xslt"
	package-version="1.5.0"
	declared-modes="yes"
	expand-text="no"
	input-type-annotations="strip"
	default-validation="strip"

	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

	xmlns:array="http://www.w3.org/2005/xpath-functions/array"
	xmlns:css3t="http://www.w3.org/TR/css3-text/"
	xmlns:dom="http://www.w3.org/2001/xml-events"
	xmlns:grddl="http://www.w3.org/2003/g/data-view#"
	xmlns:map="http://www.w3.org/2005/xpath-functions/map"
	xmlns:math="http://www.w3.org/1998/Math/MathML"
	xmlns:xforms="http://www.w3.org/2002/xforms"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

	xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0"
	xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0"
	xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0"
	xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
	xmlns:drawooo="http://openoffice.org/2010/draw"
	xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0"
	xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
	xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
	xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0"
	xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"
	xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
	xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
	xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0"
	xmlns:of="urn:oasis:names:tc:opendocument:xmlns:of:1.2"
	xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
	xmlns:officeooo="http://openoffice.org/2009/office"
	xmlns:ooo="http://openoffice.org/2004/office"
	xmlns:oooc="http://openoffice.org/2004/calc"
	xmlns:ooow="http://openoffice.org/2004/writer"
	xmlns:rpt="http://openoffice.org/2005/report"
	xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0"
	xmlns:script-module="http://openoffice.org/2000/script"
	xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
	xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
	xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
	xmlns:tableooo="http://openoffice.org/2009/table"
	xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"

	xmlns:o="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/optimizer"
>

	<xsl:variable name="o:remove-text-auto-styles" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-unused-para-auto-styles" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-hidden-list-styles" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-empty-format-nodes" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-foreign-language-attributes" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-abs-size-when-relative" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-config-view-params" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-config-print-params" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:remove-rsid" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:sort-sortable-nodes" as="xs:boolean" static="yes" select="true()" visibility="private"/>
	<xsl:variable name="o:set-config-params" as="xs:boolean" static="yes" select="true()" visibility="private"/>

	<xsl:mode
		name="o:optimize"
		on-no-match="shallow-copy" warning-on-no-match="no"
		on-multiple-match="fail" warning-on-multiple-match="yes"
		visibility="final"
	/>

	<!-- вспомогательный режим: выводим элемент только при наличии аттрибутов или потомков -->

	<xsl:mode
		name="o:where-attributes-or-elements"
		on-no-match="shallow-copy" warning-on-no-match="no"
		on-multiple-match="fail" warning-on-multiple-match="yes"
		visibility="private"
	/>

	<xsl:template mode="o:where-attributes-or-elements" match="element()">
		<xsl:variable name="o:attributes" as="attribute()*">
			<xsl:apply-templates select="@*" mode="o:optimize"/>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="exists( $o:attributes )">
				<xsl:copy>
					<xsl:copy-of select="$o:attributes"/>
					<xsl:apply-templates select="node()" mode="o:optimize"/>
				</xsl:copy>
			</xsl:when>
			<xsl:otherwise>
				<xsl:where-populated>
					<xsl:copy>
						<xsl:copy-of select="$o:attributes"/>
						<xsl:apply-templates select="node()" mode="o:optimize"/>
					</xsl:copy>
				</xsl:where-populated>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- удаляем автоматические стили символов -->

	<xsl:key name="o:auto-text-styles"
		match="office:automatic-styles/style:style[ @style:family='text' ]"
		use="@style:name"
	/>

	<xsl:template mode="o:optimize" use-when="$o:remove-text-auto-styles"
		 match="office:automatic-styles/style:style[ @style:family='text' ]"
	/>

	<xsl:template mode="o:optimize" use-when="$o:remove-text-auto-styles"
		 match="text:span[ key( 'o:auto-text-styles', @text:style-name ) ]">
		<xsl:apply-templates select="node()" mode="#current"/>
	</xsl:template>

	<!-- TODO: убирать автоматические стили только по отношению к базовому стилю символов -->
	<!-- TODO: для автоматических стилей по отношению к другим стилям символов устанавливать ссылку на исходный стиль -->

	<!-- удаляем неиспользуемые автоматические стили абзацев в content.xml -->

	<xsl:key name="o:auto-paragraph-styles" use-when="$o:remove-unused-para-auto-styles"
		match="office:automatic-styles/style:style[ @style:family='paragraph' ]"
		use="@style:name"
	/>

	<xsl:key name="o:used-paragraph-styles" use-when="$o:remove-unused-para-auto-styles"
		match="
			office:document-content/office:body/office:text//text:p
			| office:document-content/office:body/office:text//text:h
		"
		use="@text:style-name"
	/>

	<xsl:template mode="o:optimize" use-when="$o:remove-unused-para-auto-styles" match="
		office:document-content/office:automatic-styles/style:style[
		 	@style:family='paragraph'
			and not( key( 'o:used-paragraph-styles', @style:name ) )
		]
	"/>

	<!-- удаляем определения некоторых неиспользуемых стандартных стилей -->

	<xsl:template mode="o:optimize" use-when="$o:remove-hidden-list-styles" match="
		text:list-style[ @style:hidden ]
	">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="#current"/>
		</xsl:copy>
	</xsl:template>

	<!-- удаляем лишние элементы -->

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="(
		style:background-image
	)[ empty( @* | node() ) ]"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		@style:master-page-name[ . = '' ]
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		@fo:background-color[ . = 'transparent' ]
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:paragraph-properties/@style:page-number[ . = 'auto' ]
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:paragraph-properties[ @text:number-lines = 'false' ]/@text:line-number[ .='0' ]
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:paragraph-properties[ @fo:keep-together = 'always' ]/@fo:orphans
		| style:paragraph-properties[ @fo:keep-together = 'always' ]/@fo:widows
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:paragraph-properties[ @fo:text-align != 'justify' ]/@style:justify-single-word
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:style[ style:text-properties/@fo:hyphenate = 'false' ]/style:paragraph-properties/@fo:hyphenation-ladder-count
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:paragraph-properties | style:tab-stops
		| style:text-properties
	">
		<xsl:apply-templates select="." mode="o:where-attributes-or-elements"/>
	</xsl:template>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		style:text-properties[ @fo:hyphenate = 'false' ]/@fo:hyphenation-remain-char-count
		| style:text-properties[ @fo:hyphenate = 'false' ]/@fo:hyphenation-push-char-count
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-empty-format-nodes" match="
		*[ @draw:fill = 'none' ]/@draw:fill-color
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-abs-size-when-relative" match="
		*[ @style:rel-width ]/@svg:width
		| *[ @style:rel-height ]/@svg:height
		| *[ @style:vertical-rel ]/@svg:y
		| *[ @style:horizontal-rel ]/@svg:x
	"/>

	<!-- удаляем некоторые параметры конфигурации просмотра и печати -->

	<xsl:template mode="o:optimize" use-when="$o:remove-config-view-params" match="
		config:config-item-set[ @config:name = 'ooo:view-settings' ]
	"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-config-print-params" match="config:config-item[ contains-token(
		'PrinterName PrintFaxName PrinterSetup PrinterPaperFromSetup PrintPaperFromSetup PrintSingleJobs PrinterIndependentLayout AllowPrintJobCancel',
		@config:name
	)]"/>

	<!-- удаляем лишние аттрибуты -->

	<xsl:template mode="o:optimize" use-when="$o:remove-foreign-language-attributes" match="(
		@style:language-asian | @style:language-complex
		| @style:country-asian | @style:country-complex
		| @style:font-name-asian | @style:font-family-asian | @style:font-family-generic-asian
		| @style:font-style-asian | @style:font-pitch-asian| @style:font-size-asian | @style:font-weight-asian
		| @style:font-name-complex | @style:font-family-complex | @style:font-family-generic-complex
		| @style:font-style-complex | @style:font-pitch-complex | @style:font-size-complex | @style:font-weight-complex
		| @style:writing-mode
	)"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-foreign-language-attributes" match="(
		office:automatic-styles/style:style/style:text-properties/@fo:language
		| office:automatic-styles/style:style/style:text-properties/@fo:country
	)"/>

	<!-- удаляем упоминания о сессии, в которой внесены изменения -->

	<xsl:template mode="o:optimize" use-when="$o:remove-rsid" match="(
		style:text-properties/@officeooo:paragraph-rsid
		| style:text-properties/@officeooo:rsid
	)"/>

	<xsl:template mode="o:optimize" use-when="$o:remove-rsid" match="
		config:config-item[ @config:name = 'Rsid' ]
	"/>

	<!-- правила для элементов с сортировкой потомков (для минимизации изменений при сохранении OO файлов) -->

	<xsl:template mode="o:optimize" use-when="$o:sort-sortable-nodes" match="office:font-face-decls">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="#current"/>
			<xsl:apply-templates select="style:font-face" mode="#current">
				<xsl:sort select="@style:name" data-type="text" order="ascending" case-order="upper-first" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template mode="o:optimize" use-when="$o:sort-sortable-nodes" match="manifest:manifest">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="#current"/>
			<xsl:apply-templates select="manifest:file-entry" mode="#current">
				<xsl:sort select="@manifest:full-path" data-type="text" order="ascending" case-order="upper-first" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template mode="o:optimize" use-when="$o:sort-sortable-nodes" match="text:variable-decls">
		<xsl:copy>
			<xsl:apply-templates select="@*" mode="#current"/>
			<xsl:apply-templates select="text:variable-decl" mode="#current">
				<xsl:sort select="@text:name" data-type="text" order="ascending" case-order="upper-first" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

</xsl:package>