<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>
<%@include file='adminheader.html'%>

	<div class="span9">

		<h1>Products</h1>

	<jsp:useBean id="productList" class="beans.ProductListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

	<c:set var="productlist_xslt">
	   <c:import url="productlist_xslt.xsl"/>
	</c:set> 

	<x:transform xslt="${productlist_xslt}">
	    <jsp:getProperty name="productList" property="xml"/>
	</x:transform>

		<h3>Add product</h3>
		<form action="admin?action=addproduct" method="post" class="well">
  			<label>Title</label>
  			<input type="text" class="span3" name="title">
  			<label>Description</label>
  			<input type="text" class="span3" name="description">
  			<label>Price</label>
  			<input type="text" class="span3" name="price">
  			<br />
			<button type="submit" class="btn">Add</button>
		</form>
	
	</div>

</div> <!-- /row -->
</div> <!-- /container -->
<%@include file='footer.html'%>