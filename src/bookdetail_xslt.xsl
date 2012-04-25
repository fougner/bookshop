<?xml version="1.0" encoding="UTF-8" ?>
<!-- Example:
<book>
  <id>1</id>   
  <title>Javaprogramming</title>
  <authorname>Fredrik</authorname>
  <authorsurname>Alund</authorsurname> 
  <price>23</price>
  <pages>234</pages>
  <description>Bla bla bla</description>
</book>
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>
  <xsl:template match="detailpage">
    
    <h2>Book detail</h2>
    <xsl:apply-templates />
    
  </xsl:template>
  
  <xsl:template match="book">
    <table class="table table-striped">
      <tr>
        <td>Title</td>
        <td>
          <xsl:value-of select="title"/>
        </td>
      </tr>
      <tr>
        <td>Author</td>
        <td>
            <xsl:value-of select="authorsurname"/>, <xsl:value-of select="authorname"/> 
        </td>
      </tr>
      <tr>
        <td>Price</td>
        <td>
            <xsl:value-of select="price"/>
        </td>
      </tr>
      <tr>
        <td>Pages</td>
        <td><xsl:value-of select="pages" /></td>
      </tr>
      <tr>
        <td>Description</td>
        <td><xsl:value-of select="description" /></td>
      </tr>
   </table>
  <xsl:element name="a"> <!-- A link in XSLT -->
    <xsl:attribute name="href"><xsl:text>shop</xsl:text></xsl:attribute>
    <xsl:attribute name="class"><xsl:text>btn</xsl:text></xsl:attribute>
    <xsl:text>Back</xsl:text>
  </xsl:element>
  <xsl:text disable-output-escaping="yes"><![CDATA[&nbsp;&nbsp]]></xsl:text>  
  <xsl:element name="a"> <!-- A link in XSLT -->
    <xsl:attribute name="href"><xsl:text disable-output-escaping="yes"><![CDATA[shop?action=add&quantity=1&bookid=]]></xsl:text><xsl:value-of select="id"/></xsl:attribute>
    <xsl:attribute name="class"><xsl:text>btn</xsl:text></xsl:attribute>
    <xsl:text>Add one copy</xsl:text>
  </xsl:element>
  </xsl:template>

</xsl:stylesheet>
