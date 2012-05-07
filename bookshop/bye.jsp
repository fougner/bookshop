<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="webstore" uri="/bookshop"%>

<%@include file='header.html'%>

<div class="container">

	<h1>Good bye</h1>
	<p>You have logged out from the shop.</p>

	<p><a href="shop?action=show">Buy more books</a></p>
	
</div> <!-- /container -->
<%@include file='footer.html'%>
