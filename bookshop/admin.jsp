<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>

<div class="container">
	<div class="row">

	<h1>Admin area</h1>
	<h2>Feel free to add components to stock!</h2>


    	<h3>Components</h3>

	<jsp:useBean id="componentList" class="beans.ComponentListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>


<c:set var="componentlist_xslt">
   <c:import url="componentlist_xslt.xsl"/>
</c:set> 

<x:transform xslt="${componentlist_xslt}">
    <jsp:getProperty name="componentList" property="xml"/>
</x:transform>
	</div>

	<div class="row">
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

</div> <!-- /container -->
<%@include file='footer.html'%>