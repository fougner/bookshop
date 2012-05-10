<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="productlist">
  
    <xsl:apply-templates/>
        
  </xsl:template>

  <xsl:template match="product">
  
    <xsl:element name="option"> <!-- A link in XSLT -->
      <xsl:attribute name="value">
        <xsl:value-of select="id"/>
      </xsl:attribute>
      <xsl:text><xsl:value-of select="title"/></xsl:text>
    </xsl:element>
        
  </xsl:template>
  
  <xsl:template match="componentlist">

      <xsl:apply-templates/>

  </xsl:template>
  
<xsl:template match="component">
  
    <xsl:element name="option"> <!-- A link in XSLT -->
      <xsl:attribute name="value">
        <xsl:value-of select="id"/>
      </xsl:attribute>
      <xsl:text><xsl:value-of select="title"/></xsl:text>
    </xsl:element>
        
  </xsl:template>

</xsl:stylesheet>
