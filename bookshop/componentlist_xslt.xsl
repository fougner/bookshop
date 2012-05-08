<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="componentlist">
  <table class="table">
    <thead>
    <tr>
      <th>Title</th>
      <th>Price</th>
      <th>In stock</th>
      <th>Quantity</th>
      <th>Order</th>
    </tr>
    </thead>
     <tbody>
        <xsl:apply-templates/>
      </tbody>
   </table>
  </xsl:template>
  
  <xsl:template match="component">
    <form method="post" action="admin">
    <tr>
        <td>
            <xsl:value-of select="title"/>
        </td>
        <td>
            <xsl:value-of select="price"/>
        </td>
        <td>
            <xsl:value-of select="quantity"/>
        </td>
        <td>
            <xsl:element name="input"> <!--A ordinary input in XSLT-->
              <xsl:attribute name="type">text</xsl:attribute>
              <xsl:attribute name="value">1</xsl:attribute>
              <xsl:attribute name="name">quantity</xsl:attribute>
            </xsl:element>        
        </td>
        <td>
            <input class="btn" type="submit" value="BUY"/>
        </td>
    </tr>
    
    <xsl:element name="input"> <!--A ordinary input in XSLT-->
      <xsl:attribute name="type">hidden</xsl:attribute>
      <xsl:attribute name="value"><xsl:value-of select="id"/></xsl:attribute>
      <xsl:attribute name="name">componentid</xsl:attribute>
    </xsl:element>
    
    <input type="hidden" name="action" value="buycomponent"/>
   </form>
  </xsl:template>
  
</xsl:stylesheet>
