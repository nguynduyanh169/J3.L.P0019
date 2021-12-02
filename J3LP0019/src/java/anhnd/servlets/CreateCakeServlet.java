/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.servlets;

import anhnd.daos.CakeCategoryDAO;
import anhnd.daos.CakeDAO;
import anhnd.dtos.AccountDTO;
import anhnd.dtos.CakeCategoryDTO;
import anhnd.dtos.CakeDTO;
import anhnd.dtos.CakeErrorObj;
import anhnd.utils.TextUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.log4j.Logger;

/**
 *
 * @author anhnd
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class CreateCakeServlet extends HttpServlet {

    private static final String CREATE_CAKE = "admin_create_cake.jsp";
    private static final String ADMIN_MANAGE = "admin_manage_cake.jsp";
    private static final Logger LOG = Logger.getLogger(CreateCakeServlet.class.getName());

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
        String cakeName = request.getParameter("txtCakeName");
        String description = request.getParameter("txtDescription");
        String priceStr = request.getParameter("txtPrice");
        String quantityStr = request.getParameter("txtQuantity");
        String categoryId = request.getParameter("categoryChoice");
        String expirationDate = request.getParameter("txtExpirationDate");
        Part imagePart = request.getPart("imageFile");
        String url = CREATE_CAKE;
        CakeErrorObj errObj = new CakeErrorObj();
        boolean foundErr = false;
        try {
            if (cakeName.equals("")) {
                foundErr = true;
                errObj.setEmptyCakeName("Cake name cannot be blank");
            }
            if (description.equals("")) {
                foundErr = true;
                errObj.setEmptyDescription("Description cannot be blank");
            }
            if (quantityStr.equals("")) {
                foundErr = true;
                errObj.setQuantityEmpty("Quantity cannot be blank");
            }
            if (priceStr.equals("")) {
                foundErr = true;
                errObj.setPriceEmpty("Price cannot be blank");
            }
            if (!quantityStr.equals("")) {
                if (Integer.parseInt(quantityStr) < 0) {
                    foundErr = true;
                    errObj.setQuantityLowerThanZero("Quantity cannot be lower than 0");
                }
            }
            if (!priceStr.equals("")) {
                if (Float.parseFloat(priceStr) < 1000) {
                    foundErr = true;
                    errObj.setPriceLowerThanZero("Price cannot be lower than 1000d");
                } 
            }
            if (expirationDate.equals("")) {
                foundErr = true;
                errObj.setExpirationDateEmpty("Expiration date cannot be blank");
            }
            if (!expirationDate.equals("")) {
                Date currentDate = Date.valueOf(LocalDate.now());
                if (Date.valueOf(expirationDate).before(currentDate)) {
                    foundErr = true;
                    errObj.setExpirationDateErr("Expiration date is not valid");
                }
            }
            if (foundErr == true) {
                CakeCategoryDAO cakeCategoryDAO = new CakeCategoryDAO();
                List<CakeCategoryDTO> categories = cakeCategoryDAO.getCakeCategories();
                request.setAttribute("CATEGORIES", categories);
                request.setAttribute("ERROR", errObj);
            } else {
                HttpSession session = request.getSession();
                CakeDAO cakeDAO = new CakeDAO();
                String fileImageName = TextUtils.extractFileName(imagePart);
                AccountDTO account = (AccountDTO) session.getAttribute("ACCOUNT");
                String email = account.getEmail();
                Date expiration = Date.valueOf(expirationDate);
                int quantity = Integer.parseInt(quantityStr);
                float price = Float.parseFloat(priceStr);
                if (!fileImageName.equals("")) {
                    String path = this.getClass().getClassLoader().getResource("").getPath();
                    String fullPath = URLDecoder.decode(path, "UTF-8");
                    String pathArrBuild[] = fullPath.split("/WEB-INF/classes/");
                    String fullPathBuild = pathArrBuild[0];
                    fullPathBuild = fullPathBuild.substring(1);
                    String saveCakeImageToBuild = fullPathBuild.replace("/", "\\") + File.separator + "images" + File.separator + fileImageName;
                    System.out.println(saveCakeImageToBuild);
                    imagePart.write(saveCakeImageToBuild);
                    CakeDTO cakeDTO = new CakeDTO(TextUtils.getUUID(), cakeName, fileImageName, categoryId, quantity, description, price, null, expiration, 0, email);
                    boolean result = cakeDAO.insertCake(cakeDTO);
                    if (result) {
                        url = "SearchCakeServlet?searchName=&fromPrice=&toPrice=&urlForward=Search_Admin&btAction=Search";
                    }
                }
                if (fileImageName.equals("")) {
                    CakeDTO cakeDTO = new CakeDTO(TextUtils.getUUID(), cakeName, "", categoryId, quantity, description, price, null, expiration, 0, email);
                    boolean result = cakeDAO.insertCake(cakeDTO);
                    if (result) {
                        url = "SearchCakeServlet?searchName=&fromPrice=&toPrice=&urlForward=Search_Admin&btAction=Search";
                    }
                }
            }
        } catch (Exception e) {
            LOG.error("CreateCakeServlet Exception: " + e.getMessage());
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
