<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>
<%@include file='adminheader.html'%>

	<div class="span9">

    	<h1>Components</h1>

	<jsp:useBean id="componentList" class="beans.ComponentListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

	<jsp:useBean id="productList" class="beans.ProductListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>


<c:set var="componentlist_xslt">
   <c:import url="componentlist_xslt.xsl"/>
</c:set> 

<x:transform xslt="${componentlist_xslt}">
    <jsp:getProperty name="componentList" property="xml"/>
</x:transform>


	</div>
</div>
</div> <!-- /container -->
<%@include file='footer.html'%>