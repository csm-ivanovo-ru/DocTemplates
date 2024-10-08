<?xml version="1.0" encoding="UTF-8"?><xsl:transform version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:err="http://www.w3.org/2005/xqt-errors"

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
	xmlns:library="http://openoffice.org/2000/library"
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
	xmlns:toolbar="http://openoffice.org/2001/toolbar"

	xmlns:p="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/OODocumentProcessor"
	xmlns:oom="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/OODocumentProcessor"
	xmlns:fix="http://github.com/test-st-petersburg/DocTemplates/tools/xslt/system/fix"
>

	<xsl:param name="p:replace-section-source" as="xs:boolean" static="yes" select="true()"/>
	<xsl:param name="p:rename-elements-on-insert" as="xs:boolean" static="yes" select="true()"/>

	<!-- замещение `<text:section-source>` содержанием разделов #81 -->

	<xsl:key name="p:sections" use-when="$p:replace-section-source"
		match="text:section"
		use="@text:name"
	/>

	<xsl:template mode="p:internal-links-embedding" use-when="$p:replace-section-source" match="
		text:section/text:section-source[
			@text:section-name and not( @xlink:href )
			and ( @xlink:type = 'simple' ) and ( @xlink:show = 'embed' )
			and ( @xlink:actuate = 'other' )
		]
	">
		<!-- TODO: переделать параметр `p:embed-link-title` на аккумулятор -->
		<xsl:apply-templates select=" key( 'p:sections', @text:section-name )/* " mode="#current">
			<xsl:with-param name="p:embed-link-title" select="@xlink:title" as="xs:string?" tunnel="yes"/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template mode="p:internal-links-embedding" use-when="$p:replace-section-source" match="
		text:section[
			text:section-source/@text:section-name and not( text:section-source/@xlink:href )
			and ( text:section-source/@xlink:type = 'simple' ) and ( text:section-source/@xlink:show = 'replace' )
			and ( text:section-source/@xlink:actuate = 'other' )
		]
	">
		<!-- TODO: переделать параметр `p:embed-link-title` на аккумулятор -->
		<xsl:apply-templates select="key( 'p:sections', text:section-source/@text:section-name )/( * except style:style )" mode="#current">
			<xsl:with-param name="p:embed-link-title" select="text:section-source/@xlink:title" as="xs:string?" tunnel="yes"/>
		</xsl:apply-templates>
	</xsl:template>

	<!--
		при подстановке элементов (например - вместо `text:section-source`) переименование вставляемых
		разделов, таблиц, врезок
		(с учётом реквизита `text:section-source/@xlink:title`) #81
	-->

	<xsl:template mode="p:internal-links-embedding" use-when="$p:rename-elements-on-insert" match="
		@table:name
	">
		<!-- TODO: переделать параметр `p:embed-link-title` на аккумулятор -->
		<xsl:param name="p:embed-link-title" as="xs:string" required="no" select="''" tunnel="yes"/>
		<xsl:choose>
			<xsl:when test="$p:embed-link-title">
				<xsl:attribute name="{ name() }" select="concat( data(), $p:embed-link-title )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="p:internal-links-embedding" use-when="$p:rename-elements-on-insert" match="
		text:section/@text:name | @draw:name
	">
		<!-- TODO: переделать параметр `p:embed-link-title` на аккумулятор -->
		<xsl:param name="p:embed-link-title" as="xs:string" required="no" select="''" tunnel="yes"/>
		<xsl:choose>
			<xsl:when test="$p:embed-link-title">
				<xsl:attribute name="{ name() }" select="concat( data(), ' (', $p:embed-link-title, ')' )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:transform>
