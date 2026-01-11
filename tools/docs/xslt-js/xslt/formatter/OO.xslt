<?xml version="1.0" encoding="UTF-8"?><xsl:transform version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

	xmlns:css3t="http://www.w3.org/TR/css3-text/"
	xmlns:dom="http://www.w3.org/2001/xml-events"
	xmlns:grddl="http://www.w3.org/2003/g/data-view#"
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

	xmlns:f="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/formatter"

	id="OOFormatter"
	name="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/formatter/OO.xslt"
	declared-modes="yes"
	expand-text="no"
	input-type-annotations="strip"
	default-validation="strip"
>

	<xsl:import href="basic.xslt"/>

	<!-- #region правила для элементов, не подвергаемых форматированию -->

	<xsl:template mode="f:outline" match="
		text:p | text:h
		| text:span | text:a | text:note-citation | text:page-number | text:bookmark-ref
		| text:table-of-content-entry-template | text:index-title-template
		| office:meta/*
		| dc:creator | dc:date
		| loext:sender-initials
		| text:variable-set | text:variable-get
		| script-module:module
		| config:config-item
	">
		<xsl:apply-templates select="." mode="f:outline-prohibited"/>
	</xsl:template>

	<xsl:template mode="f:inline f:outline" match="(
		text:p | text:h
		| text:span | text:a | text:bookmark-ref
		| text:variable-set | text:variable-get
	)/text()">
		<xsl:apply-templates select="." mode="f:preserve-space"/>
	</xsl:template>

	<!-- #endregion правила для элементов, не подвергаемых форматированию -->

	<!-- #region форматирование текста модулей -->

	<xsl:template mode="f:inline f:outline" match="script-module:module/text()">
		<xsl:value-of select="concat( $f:new-line, f:normalize-script-text( data() ), $f:new-line )" />
	</xsl:template>

	<!-- #endregion форматирование текста модулей -->

	<xsl:function name="f:normalize-script-text" as="xs:string" visibility="private">
		<xsl:param name="f:script-text" as="xs:string"/>
		<xsl:value-of select="
			replace(
				replace(
					replace( $f:script-text, '\s+$', '' ),
					'^\s+', '' ),
				'\s+$', '' )
		"/>
	</xsl:function>

</xsl:transform>
