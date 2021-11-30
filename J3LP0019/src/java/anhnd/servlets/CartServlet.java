/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.servlets;

import anhnd.beans.CartBean;
import anhnd.dtos.CartModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author anhnd
 */
public class CartServlet extends HttpServlet {

    private static final String MEMBER_HOME = "member_home.jsp";
    private static final String MEMBER_CART = "member_cart.jsp";

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
        try {
            String action = request.getParameter("action");
            if (action.equals("Add to cart")) {
                HttpSession session = request.getSession(true);
                CartBean shop = (CartBean) session.getAttribute("SHOP");
                if (shop == null) {
                    shop = new CartBean();
                }
                String cakeId = request.getParameter("cakeId");
                String cakeName = request.getParameter("cakeName");
                String price = request.getParameter("price");
                CartModel cartModel = new CartModel(cakeId, cakeName, Float.parseFloat(price), Float.parseFloat(price));
                shop.addCake(cartModel);
                session.setAttribute("SHOP", shop);
                RequestDispatcher rd = request.getRequestDispatcher(MEMBER_HOME);
                rd.forward(request, response);
            } else if (action.equals("View cart")) {
                RequestDispatcher rd = request.getRequestDispatcher(MEMBER_CART);
                rd.forward(request, response);
            } else if (action.equals("Remove")) {
                String[] cakes = request.getParameterValues("rmv");
                if (cakes != null) {
                    HttpSession session = request.getSession();
                    if (session != null) {
                        CartBean shop = (CartBean) session.getAttribute("SHOP");
                        if (shop != null) {
                            for (int i = 0; i < cakes.length; i++) {
                                shop.remove(cakes[i]);
                            }
                            session.setAttribute("SHOP", shop);
                        }
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher("CartServlet?action=View cart");
                rd.forward(request, response);
            } else if (action.equals("Update")) {
                String cakeId = request.getParameter("cakeId");
                String newQuantity = request.getParameter("txtQuantity");
                System.out.println(newQuantity);
                System.out.println(cakeId);
                HttpSession session = request.getSession();
                if (session != null) {
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop != null) {
                        shop.updateCake(cakeId, Integer.parseInt(newQuantity));
                        session.setAttribute("SHOP", shop);
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher("CartServlet?action=View cart");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

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
