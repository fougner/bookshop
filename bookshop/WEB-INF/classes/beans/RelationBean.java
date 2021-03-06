package beans;

import java.sql.*;
import java.util.*;

/**
 * @author Alexander Fougner
 */
public class RelationBean {


    class Relation {
      public String ptitle;
      public String ctitle;
      public int pcid;

      public String toString() {
        return "<relation>" +
        "<pcid>" + pcid + "</pcid>" +
        "<ptitle>" + ptitle + "</ptitle>" +
        "<ctitle>" + ctitle + "</ctitle>" +
        "</relation>";
      }
    }

    private int id;
    private int product;
    private int component;
    private ArrayList<Relation> relations;
    private String url;
    Connection conn =null;
    Statement stmt = null;
    ResultSet rs = null;
    
    public RelationBean() {
    }

    public RelationBean(String _url) throws Exception{
      this.url = _url;
      relations = new ArrayList();
      try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url);

        }
        catch(SQLException sqle){
            throw new Exception(sqle);
        }
    }
    
    /*
    *   Add relation between Product with ID @param p
    *   and Component with ID @param c
    */
    public void addRelation(int p, int c) throws Exception {
      try {
        PreparedStatement sta = conn.prepareStatement(
            "INSERT INTO PRODUCTS_COMPONENTS (product_id, component_id) VALUES(?,?)");
        sta.setInt(1,p);
        sta.setInt(2,c);
        sta.executeUpdate();
        }
        catch(SQLException sqle){
            throw new Exception("SQLException: " + sqle);
        }
      
    }

    /*
    *   Delete relation with ID @param id
    */
    public void remove(int id) throws Exception {
      try {
        PreparedStatement sta = conn.prepareStatement("DELETE FROM PRODUCTS_COMPONENTS WHERE ID = ?");
        sta.setInt(1,id);
        sta.executeUpdate();
        }
        catch(SQLException sqle){
            throw new Exception("SQLException: " + sqle);
        }
    }

    public void update() throws Exception {
      relations.clear();
       try{
            stmt = conn.createStatement();

            String sql= "SELECT p.title AS PRODUCT , c.title AS COMPONENT, pc.* FROM PRODUCTS_COMPONENTS AS pc ";
            sql += " LEFT JOIN PRODUCTS AS p ON p.product_id = pc.product_id LEFT JOIN COMPONENTS AS c ON pc.component_id = c.component_id";

            rs= stmt.executeQuery(sql);
            
            while(rs.next()){

              Relation r = new Relation();
              r.ptitle = rs.getString("PRODUCT");
              r.ctitle = rs.getString("COMPONENT");
              r.pcid = rs.getInt("ID");
                
              relations.add(r);
                
            }
        
        }
        catch(SQLException sqle){
            throw new Exception("SQLException: couldn't update relations", sqle);
        }
    }

    public String getXml() {

      StringBuffer xmlOut = new StringBuffer();
      
      Relation r;
      Iterator iter = relations.iterator();
      StringBuffer buff = new StringBuffer();
        
      buff.append("<relationlist>");
      while(iter.hasNext()){
        r = (Relation)iter.next();
        buff.append(r.toString());
      }
      buff.append("</relationlist>");        
        
      return buff.toString();
    }   
}
