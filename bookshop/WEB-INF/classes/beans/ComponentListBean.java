package beans;

import java.util.*;
import java.sql.*;
import java.io.*;
/**
 * @author Alexander Fougner
 */
public class ComponentListBean {
    
    private Collection componentList;
    private String url;
    Connection conn =null;
    Statement stmt = null;
    ResultSet rs = null;

    public ComponentListBean() throws Exception{
    }

    public ComponentListBean(String _url) throws Exception {
        url=_url;
        componentList = new ArrayList();

        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

        }
        catch(SQLException sqle){
            throw new Exception(sqle);
        }
    }

    /*
    *   Update the collection with latest information
    *   from the database.
    */
    public void update() throws Exception{

        this.componentList.clear();

            stmt = conn.createStatement();

            String sql= "SELECT * FROM COMPONENTS";

            rs= stmt.executeQuery(sql);
            
            while(rs.next()){
                
                ComponentBean pb = new ComponentBean();
                
                pb.setId(rs.getInt("COMPONENT_ID"));
                pb.setTitle(rs.getString("TITLE"));
                pb.setPrice(rs.getInt("PRICE"));
                pb.setDescription(rs.getString("DESCRIPTION"));
                pb.setQuantity(rs.getInt("QTY"));
                componentList.add(pb);
                
            }
    }
    
    java.util.Collection getComponentList() {
        return componentList;
    }
   
    public String getXml() {
        
        ComponentBean bb=null;
        Iterator iter = componentList.iterator();
        StringBuffer buff = new StringBuffer();
        
        buff.append("<componentlist>");
        while(iter.hasNext()){
            bb=(ComponentBean)iter.next();
            buff.append(bb.getXml());
        }
        buff.append("</componentlist>");        
        
        return buff.toString();
    }

    public ComponentBean getById(int id) {
	ComponentBean bb = null;
	Iterator iter = componentList.iterator();
        
	while(iter.hasNext()){
	    bb=(ComponentBean)iter.next();
	    if(bb.getId()== id){
                return bb;
	    }
	}
	return null;
    }

    public void increaseQuantity(int id, int qty) throws Exception{

        try {
        PreparedStatement sta = conn.prepareStatement(
            "UPDATE COMPONENTS SET qty = qty + ? WHERE component_id = ?");
        sta.setInt(1,qty);
        sta.setInt(2,id);
        sta.executeUpdate();
        }
        catch(SQLException sqle){
            throw new Exception("SQLException: " + sqle);
        }
    }

    public static void main(String[] args){
        try{
	    ComponentListBean blb = new ComponentListBean();
	    System.out.println(blb.getXml());
        }
        catch(Exception e){
	    System.out.println(e.getMessage());
        }
    }
}