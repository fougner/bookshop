package beans;

import java.sql.*;

/**
 *
 * @author Alexander Fougner
 */
public class ProductBean {

    private int id;
    private String title;
    private int price;
    private String description;
    private int qty;

    private String url;
    Connection conn =null;
    Statement stmt = null;
    ResultSet rs = null;
    
    public ProductBean() {
    }

    public ProductBean(String _url) throws Exception{
      this.url = _url;
      try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

        }
        catch(SQLException sqle){
            throw new Exception(sqle);
        }
    }
    
    public int getPrice() {
        return price;
    }
    
    public void setPrice(int _price) {
        price = _price;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String _title) {
        title=_title;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId( int _id) {
        id= _id;
    }

    public void setDescription(String _description) {
        description=_description;
    }

    public String getDescription() {
        return description;
    }

    public int getQuantity() {
      return qty;
    }

    public void setQuantity(int _qty) {
      qty = _qty;
    }

    public ProductBean getCopy() {
      ProductBean pb = new ProductBean();
      pb.id = this.id;
      pb.title = this.title;
      pb.price = this.price;
      pb.description = this.description;
      pb.qty = this.qty;
      return pb;
    }

    public void saveProduct() throws Exception{
      try {
        PreparedStatement sta = conn.prepareStatement(
            "INSERT INTO PRODUCTS (title, description, price) VALUES(?,?,?)");
        sta.setString(1,title);
        sta.setString(2,description);
        sta.setInt(3,price);
        sta.executeUpdate();
        }
        catch(SQLException sqle){
            throw new Exception("SQLException: " + sqle);
        }

    }

    public String getXml() {

	// use a Stringbuffer (not String) to avoid multiple
	// object creation

     StringBuffer xmlOut = new StringBuffer();
      
      xmlOut.append("<product>");
      xmlOut.append("<id>");
      xmlOut.append(id);
      xmlOut.append("</id>");      
      xmlOut.append("<title><![CDATA[");
      xmlOut.append(title);
      xmlOut.append("]]></title>");
      xmlOut.append("<price>");
      xmlOut.append(price);      
      xmlOut.append("</price>");
      xmlOut.append("<description><![CDATA[");
      xmlOut.append(description);      
      xmlOut.append("]]></description>");
      xmlOut.append("<quantity><![CDATA[");
      xmlOut.append(qty);      
      xmlOut.append("]]></quantity>");
      xmlOut.append("</product>");
      
      return xmlOut.toString();
    }   
}
