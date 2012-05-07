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

    public ComponentListBean() throws Exception{
    }

    public ComponentListBean(String _url) throws Exception {
        url=_url;
        componentList = new ArrayList();

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

        this.componentList.clear();

        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

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