
<%@include file='header.html'%>

<div class="container">

<form class="well" method="POST" action='<%= response.encodeURL("j_security_check") %>' >
  <h2>Log in to the Bookshop</h2>

       <label>Username</label>
      <input type="text" class="span3" name="j_username" />
    <label>Password:</label>
      <input type="password" class="span3" name="j_password" />
    <br />
    <button type="submit" class="btn">Login</button>
    <button type="reset" class="btn">Reset</button>
    <p><a href="shop?action=newuser">I ain't got no account</a></p>
</form>

</div> <!-- /container -->
<%@include file='footer.html'%>