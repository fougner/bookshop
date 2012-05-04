/*
 * BookBean.java
 *
 */
package beans;

/**
 *
 * @author Alexander Fougner
 */
public class BookBean {

    // describe a book
    
    private int id;
    private String title;
    private int price;
    private String description;
    
    
    /** Creates a new instance of BookBean */
    public BookBean() {
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

    // create an XML document describing the book
    
    public String getXml() {

	// use a Stringbuffer (not String) to avoid multiple
	// object creation

     StringBuffer xmlOut = new StringBuffer();
      
      xmlOut.append("<book>");
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
      xmlOut.append("</book>");
      
      return xmlOut.toString();
    
        
    }   
}
