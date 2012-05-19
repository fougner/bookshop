<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<jsp:include page='header.jsp'>
<jsp:param name="page" value="checkout" />
</jsp:include>

<div class="container">

<c:if test="${sessionScope.currentUser == null}">
  <bookshop:profile url="${jdbcURL}"/>
</c:if>
<c:set var="shoppingcart_xslt">
   <c:import url="shoppingcart_checkout_xslt.xsl"/>
</c:set> 
<x:transform xslt="${shoppingcart_xslt}">
   <checkout>
   <bookshop:shoppingcart/>
   <name>${profile.name}</name>
   <address>${profile.street}</address>
   <zip>${profile.zip}</zip>
   <city>${profile.city}</city>
   </checkout>
</x:transform>

</div> <!-- /container -->
<%@include file='footer.html'%>

