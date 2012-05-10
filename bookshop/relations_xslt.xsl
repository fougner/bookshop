<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:template match="relationlist">
  <table class="table">
    <thead>
    <tr>
      <th>ID</th>
      <th>Product</th>
      <th>Component</th>
    </tr>
    </thead>
     <tbody>
        <xsl:apply-templates/>
      </tbody>
   </table>
  </xsl:template>
  
  <xsl:template match="relation">
      <tr>
        <td>
            <xsl:value-of select="pcid"/>
        </td>
        <td>
            <xsl:value-of select="ptitle"/>
        </td>
        <td>
            <xsl:value-of select="ctitle"/>
        </td>
      </tr>
  </xsl:template>
  
</xsl:stylesheet>
