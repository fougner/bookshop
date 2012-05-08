<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="productlist">
  <table class="table span8">
    <thead>
      <tr>
        <th>Product</th><th>Price</th><th>In stock</th><th>Quantity</th><th>Order</th>
      </tr>
  </thead>
        <xsl:apply-templates/>
   </table>
  </xsl:template>
  
  <xsl:template match="product">
    <form method="post" action="shop">
    <tr>
        <td>
          <xsl:element name="a"> <!-- A link in XSLT -->
              <xsl:attribute name="href"><xsl:text disable-output-escaping="yes"><![CDATA[shop?action=detail&bookid=]]></xsl:text><xsl:value-of select="id"/></xsl:attribute>
              <xsl:text><xsl:value-of select="title"/></xsl:text>
            </xsl:element>
            
        </td>
        <td>
            <xsl:value-of select="price"/>
        </td>
        <td>
            <xsl:value-of select="quantity"/>
        </td>
        <td>
            <xsl:element name="input"> <!--A ordinary input in XSLT-->
              <xsl:attribute name="size">2</xsl:attribute>
              <xsl:attribute name="type">text</xsl:attribute>
              <xsl:attribute name="value">1</xsl:attribute>
              <xsl:attribute name="name">quantity</xsl:attribute>
            </xsl:element>        
        </td>
        <td>
            <input class="btn" type="submit" value="Add to cart"/>
        </td>
    </tr>
    
    <xsl:element name="input"> <!--A ordinary input in XSLT-->
      <xsl:attribute name="type">hidden</xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select="id"/></xsl:attribute>
      <xsl:attribute name="name">bookid</xsl:attribute>
    </xsl:element>
    
    <input type="hidden" name="action" value="add"/>
   </form>
  </xsl:template>
  
</xsl:stylesheet>
