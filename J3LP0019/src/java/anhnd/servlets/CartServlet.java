/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.servlets;

import anhnd.beans.CartBean;
import anhnd.daos.CakeDAO;
import anhnd.daos.OrderDAO;
import anhnd.daos.OrderDetailDAO;
import anhnd.daos.PaymentDAO;
import anhnd.dtos.AccountDTO;
import anhnd.dtos.CartModel;
import anhnd.dtos.OrderDTO;
import anhnd.dtos.OrderDetailDTO;
import anhnd.dtos.PaymentDTO;
import anhnd.utils.CartUtils;
import anhnd.utils.Constant;
import anhnd.utils.TextUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
    private static final String GUEST_HOME = "home.jsp";
    private static final String MEMBER_CART = "member_cart.jsp";
    private static final String GUEST_CART = "guest_cart.jsp";
    private static final String VIEW_ORDER = "view_order.jsp";
    private static final String GUEST_CONFIRM_ORDER = "guest_confirm_order.jsp";

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
                String quantity = request.getParameter("quantity");
                CartModel cartModel = new CartModel(cakeId, cakeName, Float.parseFloat(price), Float.parseFloat(price), Integer.parseInt(quantity));
                shop.addCake(cartModel);
                session.setAttribute("SHOP", shop);
                RequestDispatcher rd = request.getRequestDispatcher(MEMBER_HOME);
                rd.forward(request, response);
            } else if (action.equals("Guest add to cart")) {
                HttpSession session = request.getSession(true);
                CartBean shop = (CartBean) session.getAttribute("SHOP");
                if (shop == null) {
                    shop = new CartBean();
                }
                String cakeId = request.getParameter("cakeId");
                String cakeName = request.getParameter("cakeName");
                String price = request.getParameter("price");
                String quantity = request.getParameter("quantity");
                CartModel cartModel = new CartModel(cakeId, cakeName, Float.parseFloat(price), Float.parseFloat(price), Integer.parseInt(quantity));
                shop.addCake(cartModel);
                session.setAttribute("SHOP", shop);
                RequestDispatcher rd = request.getRequestDispatcher(GUEST_HOME);
                rd.forward(request, response);
            } else if (action.equals("View cart")) {
                RequestDispatcher rd = request.getRequestDispatcher(MEMBER_CART);
                rd.forward(request, response);
            } else if (action.equals("Guest view cart")) {
                RequestDispatcher rd = request.getRequestDispatcher(GUEST_CART);
                rd.forward(request, response);
            } else if (action.equals("Confirm order")) {
                String url = GUEST_CONFIRM_ORDER;
                HttpSession session = request.getSession();
                CartBean shop = (CartBean) session.getAttribute("SHOP");
                if (shop != null) {
                    boolean checkQuantity = false;
                    String cakeName = "";
                    List<CartModel> cartItems = CartUtils.getAllCart(shop);
                    for (CartModel item : cartItems) {
                        if (item.getCurrentQuantity() - item.getQuantity() < 0) {
                            checkQuantity = true;
                            cakeName = item.getCakeName();
                        }
                    }
                    if (checkQuantity) {
                        request.setAttribute("QUANTITYERROR", "The quantity of " + cakeName + " is not enough to order!");
                        url = "CartServlet?action=Guest view cart";
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Remove")) {
                String cakeId = request.getParameter("cakeId");
                String url = "CartServlet?action=View cart";
                if (cakeId != null) {
                    HttpSession session = request.getSession();
                    if (session != null) {
                        AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                        CartBean shop = (CartBean) session.getAttribute("SHOP");
                        if (shop != null) {
                            shop.removeCake(cakeId);
                            session.setAttribute("SHOP", shop);
                        }
                        if (account == null) {
                            url = "CartServlet?action=Guest view cart";
                        }

                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Update")) {
                String cakeId = request.getParameter("cakeId");
                String newQuantity = request.getParameter("txtQuantity");
                String url = "CartServlet?action=View cart";
                HttpSession session = request.getSession();
                if (session != null) {
                    AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop != null) {
                        shop.updateCake(cakeId, Integer.parseInt(newQuantity));
                        session.setAttribute("SHOP", shop);
                    }
                    if (account == null) {
                        url = "CartServlet?action=Guest view cart";
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Order")) {
                String url = VIEW_ORDER;
                HttpSession session = request.getSession();
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                PaymentDAO paymentDAO = new PaymentDAO();
                CakeDAO cakeDAO = new CakeDAO();
                if (session != null) {
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop != null) {
                        boolean checkQuantity = false;
                        String cakeName = "";
                        List<CartModel> cartItems = CartUtils.getAllCart(shop);
                        for (CartModel item : cartItems) {
                            if (item.getCurrentQuantity() - item.getQuantity() < 0) {
                                checkQuantity = true;
                                cakeName = item.getCakeName();
                            }
                        }
                        if (checkQuantity) {
                            request.setAttribute("QUANTITYERROR", "The quantity of " + cakeName + " is not enough to order!");
                            url = "CartServlet?action=View cart";
                        } else {
                            AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                            OrderDTO orderDTO = new OrderDTO(TextUtils.getUUID(), account.getEmail(), account.getAddress(), account.getPhone(), 0, null);
                            boolean check = orderDAO.insertOrder(orderDTO);
                            if (check) {
                                List<CartModel> items = CartUtils.getAllCart(shop);
                                for (CartModel item : items) {
                                    OrderDetailDTO orderDetailDTO = new OrderDetailDTO(TextUtils.getUUID(), orderDTO.getOrderId(), item.getCakeId(), item.getCakeName(), item.getQuantity(), item.getPrice());
                                    orderDetailDAO.insertOrderDetails(orderDetailDTO);
                                    cakeDAO.updateQuantity(item.getCakeId(), item.getCurrentQuantity() - item.getQuantity());
                                }
                                PaymentDTO paymentDTO = new PaymentDTO(TextUtils.getUUID(), orderDTO.getOrderId(), 0, Constant.CASH);
                                paymentDAO.insertPayment(paymentDTO);
                            }
                            session.removeAttribute("SHOP");
                            OrderDTO savedOrder = orderDAO.getOrderById(orderDTO.getOrderId());
                            List<OrderDetailDTO> detailOfOrder = orderDetailDAO.getDetailsOfOrder(orderDTO.getOrderId());
                            PaymentDTO paymentDTO = paymentDAO.getPaymentByOrderId(orderDTO.getOrderId());
                            request.setAttribute("ORDER", savedOrder);
                            request.setAttribute("ORDERDETAILS", detailOfOrder);
                            request.setAttribute("PAYMENT", paymentDTO);
                        }
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (action.equals("Guest order")) {
                String email = request.getParameter("txtEmail");
                String address = request.getParameter("txtAddress");
                String phone = request.getParameter("txtPhone");
                HttpSession session = request.getSession();
                OrderDAO orderDAO = new OrderDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                PaymentDAO paymentDAO = new PaymentDAO();
                CakeDAO cakeDAO = new CakeDAO();
                if (session != null) {
                    CartBean shop = (CartBean) session.getAttribute("SHOP");
                    if (shop != null) {
                        OrderDTO orderDTO = new OrderDTO(TextUtils.getUUID(), email, address, phone, 0, null);
                        boolean check = orderDAO.insertOrder(orderDTO);
                        if (check) {
                            List<CartModel> items = CartUtils.getAllCart(shop);
                            for (CartModel item : items) {
                                OrderDetailDTO orderDetailDTO = new OrderDetailDTO(TextUtils.getUUID(), orderDTO.getOrderId(), item.getCakeId(), item.getCakeName(), item.getQuantity(), item.getPrice());
                                orderDetailDAO.insertOrderDetails(orderDetailDTO);
                                cakeDAO.updateQuantity(item.getCakeId(), item.getCurrentQuantity() - item.getQuantity());
                            }
                            PaymentDTO paymentDTO = new PaymentDTO(TextUtils.getUUID(), orderDTO.getOrderId(), 0, Constant.CASH);
                            paymentDAO.insertPayment(paymentDTO);
                        }
                        session.removeAttribute("SHOP");
                        OrderDTO savedOrder = orderDAO.getOrderById(orderDTO.getOrderId());
                        List<OrderDetailDTO> detailOfOrder = orderDetailDAO.getDetailsOfOrder(orderDTO.getOrderId());
                        PaymentDTO paymentDTO = paymentDAO.getPaymentByOrderId(orderDTO.getOrderId());
                        request.setAttribute("ORDER", savedOrder);
                        request.setAttribute("ORDERDETAILS", detailOfOrder);
                        request.setAttribute("PAYMENT", paymentDTO);
                    }
                }
                RequestDispatcher rd = request.getRequestDispatcher(VIEW_ORDER);
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
