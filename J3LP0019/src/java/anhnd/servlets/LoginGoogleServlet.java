/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.servlets;

import anhnd.daos.AccountDAO;
import anhnd.dtos.AccountDTO;
import anhnd.utils.GooglePojo;
import anhnd.utils.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginGoogleServlet extends HttpServlet {

    private static Logger LOG = Logger.getLogger(LoginGoogleServlet.class.getName());
    private static final String MEMBER_HOME = "member_home.jsp";
    private static final String ADMIN_MANAGE_PRODUCT = "admin_manage_cake.jsp";
    private static final String INVALID_PAGE = "invalid.html";
    private static final String ACCESS_DENIED_PAGE = "access_denied.html";
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
        String url = INVALID_PAGE;
        try {
            String code = request.getParameter("code");
            if (code.equals("") || code.isEmpty()) {
                url = INVALID_PAGE;
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                AccountDAO dao = new AccountDAO();
                AccountDTO dto = dao.checkLoginWithGoogle(googlePojo.getEmail());
                if (dto != null) {
                    if (dto.getStatus() != 2) {
                        switch (dto.getRoleId()) {
                            case 2: {
                                url = MEMBER_HOME;
                                HttpSession session = request.getSession();
                                session.setAttribute("ACCOUNT", dto);
                                break;
                            }
                            case 1: {
                                url = ADMIN_MANAGE_PRODUCT;
                                HttpSession session = request.getSession();
                                session.setAttribute("ACCOUNT", dto);
                                break;
                            }
                            default:
                                url = INVALID_PAGE;
                                break;
                        }
                    } else {
                        url = ACCESS_DENIED_PAGE;
                    }
                }
            }
        } catch (Exception e) {
            LOG.error("LoginGoogleServlet_Exception " + e.getMessage());
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
