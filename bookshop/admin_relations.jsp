<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>
<%@include file='adminheader.html'%>

	<div class="span9">

		<h1>Relations</h1>

	<jsp:useBean id="relationList" class="beans.RelationBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

	<jsp:useBean id="productList" class="beans.ProductListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

	<jsp:useBean id="componentList" class="beans.ComponentListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

	<c:set var="relationlist_xslt">
	   <c:import url="relationlist_xslt.xsl"/>
	</c:set> 

	<x:transform xslt="${relationlist_xslt}">
	    <jsp:getProperty name="relationList" property="xml"/>
	</x:transform>

	<c:set var="relationform_xslt">
	   <c:import url="relationform_xslt.xsl"/>
	</c:set> 

		<h3>Add relation</h3>

		<form action="admin?action=addrelation" method="post" class="well">
        <label>Product</label>
        <select name="product">
        	<x:transform xslt="${relationform_xslt}">
	    		<jsp:getProperty name="productList" property="xml"/>
			</x:transform>
        </select>
        <label>Component</label>
        	<select name="component">
        	<x:transform xslt="${relationform_xslt}">
	    		<jsp:getProperty name="componentList" property="xml"/>
			</x:transform>
			</select>
        <br />
      <button type="submit" class="btn">Add</button>
    	</form>
	
	</div>

</div> <!-- /row -->
</div> <!-- /container -->
<%@include file='footer.html'%>