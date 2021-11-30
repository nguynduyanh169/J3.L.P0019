<%-- 
    Document   : admin_update_cake.jsp
    Created on : Nov 30, 2021, 12:26:25 PM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Cake</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $(".datepicker").datepicker();
            });
        </script>
    </head>
    <body>
        <c:set var="categories" value="${requestScope.CATEGORIES}" />
        <c:set var="cake" value="${requestScope.EDITCAKE}" />
        <c:set var="error" value="${requestScope.ERROR}"/>
        <h1 style=" display: flex;justify-content: center;margin-bottom: 50px">Update cake</h1> <br><br>
        <c:if test="${empty error}">
        <form action="updateCake" method="POST" enctype="multipart/form-data">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txtCakeName" value="${cake.cakeName}"/>
                            <input type="hidden" name="txtCakeId" value="${cake.cakeId}"</td>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="txtDescription" value="${cake.description}"/></td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="number" name="txtQuantity" value="${cake.quantity}"/></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="number" name="txtPrice" step="0.1" value="${cake.price}"/></td>
                    </tr>
                    <tr>
                        <td>Type </td>
                        <td><select name="categoryChoice">
                                <c:forEach var="item" items="${categories}">
                                    <c:if test="${cake.categoryId eq item.categoryId}">
                                        <option value="${item.categoryId}" selected="true">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                    </c:if>
                                    <c:if test="${cake.categoryId eq item.categoryId == false}">
                                        <option value="${item.categoryId}">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td>
                            <c:if test="${not empty cake.imgPath}">
                                <img src="images/${cake.imgPath}" style="display:block; width:50px; height:50px;">
                            </c:if>
                            <c:if test="${empty cake.imgPath}">
                                <img src="images/notfound.jpg" style="display:block; width:50px; height:50px;">
                            </c:if>
                        </td>
                        <td><input type="file" name="imageFile"/></td>
                    </tr>
                    <tr>
                        <td>Expiration Date</td>
                        <td><input type="date" name="txtExpirationDate" value="${cake.expirationDate}"/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="btAction" value="Update Cake"/> <input type="reset" value="Reset"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
        </c:if>
        <c:if test="${not empty error}">
            <form action="updateCake" method="POST" enctype="multipart/form-data">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txtCakeName" value="${cake.cakeName}"/>
                            <input type="hidden" name="txtCakeId" value="${cake.cakeId}"</td>
                        <c:if test="${not empty error.emptyCakeName}">
                                <td><font color="red">
                                    ${error.emptyCakeName}
                                    </font>
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td>Description</td>
                        <td><input type="text" name="txtDescription" value="${cake.description}"/></td>
                        <c:if test="${not empty error.emptyDescription}">
                                <td><font color="red">
                                    ${error.emptyDescription}
                                    </font>
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="number" name="txtQuantity" value="${cake.quantity}"/></td>
                        <c:if test="${not empty error.quantityLowerThanZero}">
                                <td><font color="red">
                                    ${error.quantityLowerThanZero}
                                    </font>
                                </td>
                            </c:if>
                                <c:if test="${not empty error.quantityEmpty}">
                                <td><font color="red">
                                    ${error.quantityEmpty}
                                    </font>
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="number" name="txtPrice" step="0.1" value="${cake.price}"/></td>
                        <c:if test="${not empty error.priceLowerThanZero}">
                                <td><font color="red">
                                    ${error.priceLowerThanZero}
                                    </font>
                                </td>
                            </c:if>
                                <c:if test="${not empty error.priceEmpty}">
                                <td><font color="red">
                                    ${error.priceEmpty}
                                    </font>
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td>Type </td>
                        <td><select name="categoryChoice">
                                <c:forEach var="item" items="${categories}">
                                    <c:if test="${cake.categoryId eq item.categoryId}">
                                        <option value="${item.categoryId}" selected="true">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                    </c:if>
                                    <c:if test="${cake.categoryId eq item.categoryId == false}">
                                        <option value="${item.categoryId}">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Image</td>
                        <td>
                            <c:if test="${not empty cake.imgPath}">
                                <img src="images/${cake.imgPath}" style="display:block; width:50px; height:50px;">
                            </c:if>
                            <c:if test="${empty cake.imgPath}">
                                <img src="images/notfound.jpg" style="display:block; width:50px; height:50px;">
                            </c:if>
                        </td>
                        <td><input type="file" name="imageFile"/></td>
                    </tr>
                    <tr>
                        <td>Expiration Date</td>
                        <td><input type="date" name="txtExpirationDate" value="${cake.expirationDate}"/></td>
                         <c:if test="${not empty error.expirationDateErr}">
                                <td><font color="red">
                                    ${error.expirationDateErr}
                                    </font>
                                </td>
                            </c:if>
                                <c:if test="${not empty error.expirationDateEmpty}">
                                <td><font color="red">
                                    ${error.expirationDateEmpty}
                                    </font>
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="btAction" value="Update Cake"/> <input type="reset" value="Reset"/></td>
                    </tr>
                </tbody>
            </table>
        </form>
        </c:if>
    </body>
</html>
