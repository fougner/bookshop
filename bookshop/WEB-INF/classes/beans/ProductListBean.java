package beans;

import java.util.*;
import java.sql.*;
import java.io.*;
/**
 *
 * @author Alexander Fougner
 */
public class ProductListBean {
    
    private Collection productList;
    private String url=null;

    public ProductListBean() throws Exception{
    }

    public ProductListBean(String _url) throws Exception {
        url=_url;
        productList = new ArrayList();

        this.update();
        
    }

    /*
    *   Update the collection with latest information
    *   from the database.
    */
    public void update() throws Exception{

        Connection conn =null;
        Statement stmt = null;
        ResultSet rs = null;

        this.productList.clear();

        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

            stmt = conn.createStatement();

            String sql= "SELECT p1.* , MIN( p3.QTY ) AS QTY FROM PRODUCTS AS p1";
            sql += " LEFT JOIN PRODUCTS_COMPONENTS AS p2 ON p1.product_id = p2.product_id";
            sql += " LEFT JOIN COMPONENTS AS p3 ON p2.component_id = p3.component_id";
            sql += " GROUP BY p1.PRODUCT_ID";

            rs= stmt.executeQuery(sql);
            
            while(rs.next()){
                
                ProductBean pb = new ProductBean();
                
                pb.setId(rs.getInt("PRODUCT_ID"));
                pb.setTitle(rs.getString("TITLE"));
                pb.setPrice(rs.getInt("PRICE"));
                pb.setDescription(rs.getString("DESCRIPTION"));
                pb.setQuantity(rs.getInt("QTY"));
                productList.add(pb);
                
            }
        
        }
        catch(SQLException sqle){
            throw new Exception(sqle);
        }
    
        finally{
        try{
              rs.close();
            }
            catch(Exception e) {}
            try{
              stmt.close();
            }
        catch(Exception e) {}
            try {
              conn.close();
            }
            catch(Exception e){}
        }
    }
    
    java.util.Collection getProductList() {
        return productList;
    }
   
    public String getXml() {
        
        ProductBean bb=null;
        Iterator iter = productList.iterator();
        StringBuffer buff = new StringBuffer();
        
        buff.append("<productlist>");
        while(iter.hasNext()){
            bb=(ProductBean)iter.next();
            buff.append(bb.getXml());
        }
        buff.append("</productlist>");        
        
        return buff.toString();
    }

    public ProductBean getById(int id) {
	ProductBean bb = null;
	Iterator iter = productList.iterator();
        
	while(iter.hasNext()){
	    bb=(ProductBean)iter.next();
	    if(bb.getId()== id){
                return bb;
	    }
	}
	return null;
    }

    public static void main(String[] args){
        try{
	    ProductListBean blb = new ProductListBean();
	    System.out.println(blb.getXml());
        }
        catch(Exception e){
	    System.out.println(e.getMessage());
        }
    }
}