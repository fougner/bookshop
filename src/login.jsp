<%@include file='header.html'%>

<div class="container">
 <div class="row">

<form method="POST" class="well span4" action='<%= response.encodeURL("j_security_check") %>' >
  <h2>Log in to the Bookshop</h2>
  
      <label>Username:</label>
      <input type="text" name="j_username">
    
      <label>Password:</label>
      <input type="password" name="j_password">
    
      <br />
       <button type="submit" class="btn btn-primary">Log in</button>
       <button type="reset" class="btn">Reset</button>
      
    
      <a class="btn" href="shop?action=newuser">I ain't got no account</a>
</form>

</div> 
</div> <!-- /container -->
<%@include file='footer.html'%>
