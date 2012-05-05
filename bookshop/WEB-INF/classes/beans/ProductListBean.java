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
        Connection conn =null;
        Statement stmt = null;
        ResultSet rs = null;
        productList = new ArrayList();
        try{

            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

            stmt = conn.createStatement();

            String sql="SELECT * FROM PRODUCTS";
            rs= stmt.executeQuery(sql);
            
            while(rs.next()){
                
                ProductBean pb = new ProductBean();
                
                pb.setId(rs.getInt("PRODUCT_ID"));
                pb.setTitle(rs.getString("TITLE"));
                pb.setPrice(rs.getInt("PRICE"));
                pb.setDescription(rs.getString("DESCRIPTION"));
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