<?xml version="1.0" encoding="UTF-8" ?>
<!-- Exempel:
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

  <xsl:template match="checkout">
<div class="row">
  <table class="table span6">
    <thead>
      <tr>
        <th>Title</th>
        <th>Quantity</th>
      </tr>
    </thead>
      <tbody>
        <xsl:apply-templates select="shoppingcart/order"/>
      </tbody>
   </table>
</div>
<div class="row span6">
  <form action="shop" method="post">
      <input type="hidden" name="action" value="save" />
      <label>Name</label>
          <input>
              <xsl:attribute name="type">text</xsl:attribute>
              <xsl:attribute name="name">shipping_name</xsl:attribute>
              <xsl:attribute name="value"><xsl:value-of select="name"/></xsl:attribute>
          </input>
        <label>Address</label>
          <input>
             <xsl:attribute name="type">text</xsl:attribute> 
             <xsl:attribute name="name">shipping_address</xsl:attribute>
             <xsl:attribute name="value"><xsl:value-of select="address"/></xsl:attribute>
          </input>
        <label>Zip code</label>
          <input>
              <xsl:attribute name="type">text</xsl:attribute>
              <xsl:attribute name="name">shipping_zipcode</xsl:attribute>
              <xsl:attribute name="value"><xsl:value-of select="zip"/></xsl:attribute>
          </input>
        <label>City</label>
          <input>
             <xsl:attribute name="type">text</xsl:attribute>
             <xsl:attribute name="name">shipping_city</xsl:attribute>
             <xsl:attribute name="value"><xsl:value-of select="city"/></xsl:attribute>
          </input>
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">Order</button>
        </div>
  </form>
</div>
  </xsl:template>
  <xsl:template match="shoppingcart/order">
    <tr>
        <td>
            <xsl:value-of select="product/title"/>
        </td>
        <td align="right">
            <xsl:value-of select="product/quantity"/>
        </td>
    </tr>
  </xsl:template>

  
</xsl:stylesheet>
