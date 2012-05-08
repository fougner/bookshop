<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="detailpage">
    
    <div class="container">
    <h2>Product detail</h2>
      <xsl:apply-templates />
    </div>

  </xsl:template>
  
  <xsl:template match="product">
    <div class="container">
      <div class="row">
      <table class="table span6">
        <tr>
          <td><h4>Name</h4></td>
          <td>
            <xsl:value-of select="title"/>
          </td>
        </tr>
        <tr>
          <td><h4>Price</h4></td>
          <td>
              <xsl:value-of select="price"/>
          </td>
        </tr>
        <tr>
          <td><h4>Description</h4></td>
          <td><xsl:value-of select="description" /></td>
        </tr>
    </table>
    </div>
    <div class="row">
    <xsl:element name="a"> <!-- A link in XSLT -->
        <xsl:attribute name="href"><xsl:text>shop</xsl:text></xsl:attribute>
        <xsl:attribute name="class"><xsl:text>btn</xsl:text></xsl:attribute>
        <xsl:text>Back</xsl:text>
    </xsl:element>
      <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp]]></xsl:text>  
    <xsl:element name="a"> <!-- A link in XSLT -->
      <xsl:attribute name="class"><xsl:text>btn</xsl:text></xsl:attribute>
      <xsl:attribute name="href"><xsl:text disable-output-escaping="yes"><![CDATA[shop?action=add&quantity=1&bookid=]]></xsl:text><xsl:value-of select="id"/></xsl:attribute>
      <xsl:text>Add one copy</xsl:text>
    </xsl:element>
  </div>
  </div>
  </xsl:template>

</xsl:stylesheet>
