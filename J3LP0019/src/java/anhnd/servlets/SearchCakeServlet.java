/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.servlets;

import anhnd.daos.CakeCategoryDAO;
import anhnd.daos.CakeDAO;
import anhnd.dtos.CakeCategoryDTO;
import anhnd.dtos.CakeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author anhnd
 */
public class SearchCakeServlet extends HttpServlet {

    private static final String HOME_PAGE = "home.jsp";
    private static final String MEMBER_HOME = "member_home.jsp";
    private static final String ADMIN_HOME = "admin_manage_cake.jsp";
    private static final Logger LOG = Logger.getLogger(SearchCakeServlet.class.getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String searchName = request.getParameter("searchName");
        String fromPrice = request.getParameter("fromPrice");
        String toPrice = request.getParameter("toPrice");
        String categoryId = request.getParameter("categoryChoice");
        int pageIndex = 1;
        if (request.getParameter("page") != null) {
            pageIndex = Integer.parseInt(request.getParameter("page"));
        }
        int pageSize = 5;
        int endPage = 0;
        String url = request.getParameter("urlForward");
        if (url.equals("Search_Member")) {
            url = MEMBER_HOME;
        } else if (url.equals("Search_Admin")) {
            url = ADMIN_HOME;
        } else if (url.equals("Search_Home")) {
            url = HOME_PAGE;
        }
        try {
            CakeDAO cakeDAO = new CakeDAO();
            CakeCategoryDAO cakeCategoryDAO = new CakeCategoryDAO();
            if (fromPrice.equals("") && toPrice.equals("")) {
                int countCakeByName = cakeDAO.countCakeByLikeName(searchName, categoryId == "" ? null : categoryId, 0, 0);
                endPage = countCakeByName / pageSize;
                if (countCakeByName % pageSize != 0) {
                    endPage++;
                }
                List<CakeDTO> cakes = cakeDAO.getCakeByLikeName(searchName, pageIndex, pageSize, categoryId == "" ? null : categoryId, 0, 0);
                List<CakeCategoryDTO> categories = cakeCategoryDAO.getCakeCategories();
                HttpSession session = request.getSession();
                session.setAttribute("CAKES", cakes);
                session.setAttribute("CATEGORIES", categories);
                if (categoryId != null || !"".equals(categoryId)) {
                    session.setAttribute("SELECTCATEGORY", categoryId);
                }
                session.setAttribute("TOTALPAGE", endPage);
            } else {
                int countCakeByName = cakeDAO.countCakeByLikeName(searchName, "".equals(categoryId) ? null : categoryId, Float.parseFloat(fromPrice), Float.parseFloat(toPrice));
                endPage = countCakeByName / pageSize;
                if (countCakeByName % pageSize != 0) {
                    endPage++;
                }
                List<CakeDTO> cakes = cakeDAO.getCakeByLikeName(searchName, pageIndex, pageSize, "".equals(categoryId) ? null : categoryId, Float.parseFloat(fromPrice), Float.parseFloat(toPrice));
                List<CakeCategoryDTO> categories = cakeCategoryDAO.getCakeCategories();
                HttpSession session = request.getSession();
                session.setAttribute("CAKES", cakes);
                session.setAttribute("CATEGORIES", categories);
                if (categoryId != null) {
                    session.setAttribute("SELECTCATEGORY", categoryId);
                }
                session.setAttribute("TOTALPAGE", endPage);
            }
        } catch (Exception e) {
            LOG.error("SearchCakeServlet Exception: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
