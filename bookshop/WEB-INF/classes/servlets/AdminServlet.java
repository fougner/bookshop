package servlets;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import beans.*;
/**
 *
 * @author Alexander Fougner
 * @version 1.0
 */
public class AdminServlet extends HttpServlet {

    private ProductListBean productList = null;
    private ComponentListBean componentList;
    private String jdbcURL;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        jdbcURL = config.getInitParameter("JDBC_URL");

        try{
            //productList = new ProductListBean(jdbcURL);
            componentList = new ComponentListBean(jdbcURL);
        }
        catch(Exception e){
            throw new ServletException(e);
        }

		ServletContext sc = getServletContext();
		sc.setAttribute("componentList",componentList);
     }

    public void destroy() {
        
    }
    
    protected void processRequest(HttpServletRequest request, 
                                  HttpServletResponse response)
    throws ServletException, java.io.IOException {

        HttpSession sess = request.getSession();
        RequestDispatcher rd = null;
		sess.setAttribute("currentUser", request.getRemoteUser());
        sess.setAttribute("jdbcURL",jdbcURL);

        try {
	//if(request.getParameter("action") == null || 
    //       request.getParameter("action").equals("show")){
            componentList.update();
            rd = request.getRequestDispatcher("/admin.jsp");
            rd.forward(request,response);
        } catch(Exception e){
            throw new ServletException("Error", e);
        }
	//}
    }


    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, 
                         HttpServletResponse response)
	throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response)
	throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "The AdminServlet";
    }
}




