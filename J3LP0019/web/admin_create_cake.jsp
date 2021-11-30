<%-- 
    Document   : admin_create_cake
    Created on : Nov 30, 2021, 7:43:01 AM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Cake</title>
    </head>
    <body>
        <c:set var="categories" value="${requestScope.CATEGORIES}"/>
        <c:set var="error" value="${requestScope.ERROR}" />
        <h1 style=" display: flex;justify-content: center;margin-bottom: 50px">Create new cake</h1> <br><br>
        <c:if test="${empty error}">
            <form action="createCake" method="POST" enctype="multipart/form-data">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtCakeName" value="${param.txtCakeName}"/></td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" name="txtDescription" value="${param.txtDescription}"/></td>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="number" name="txtQuantity" value="${param.txtQuantity}"/></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td><input type="number" name="txtPrice" step="0.1" value="${param.txtPrice}"/></td>
                        </tr>
                        <tr>
                            <td>Type </td>
                            <td><select name="categoryChoice">
                                    <c:forEach var="item" items="${categories}">
                                        <option value="${item.categoryId}">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td>Image</td>
                            <td><input type="file" name="imageFile"/></td>
                        </tr>
                        <tr>
                            <td>Expiration Date</td>
                            <td><input type="date" name="txtExpirationDate"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="btAction" value="Create Cake"/> <input type="reset" value="Reset"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </c:if>
        <c:if test="${not empty error}">
            <form action="createCake" method="POST" enctype="multipart/form-data">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="txtCakeName" value="${param.txtCakeName}"/></td>
                                <c:if test="${not empty error.emptyCakeName}">
                                <td><font color="red">
                                    ${error.emptyCakeName}
                                    </font>
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" name="txtDescription" value="${param.txtDescription}"/></td>
                                <c:if test="${not empty error.emptyDescription}">
                                <td><font color="red">
                                    ${error.emptyDescription}
                                    </font>
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>Quantity</td>
                            <td><input type="number" name="txtQuantity" value="${param.txtQuantity}"/></td>
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
                            <td><input type="number" name="txtPrice" step="0.1" value="${param.txtPrice}"/></td>
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
                                        <option value="${item.categoryId}">
                                            <c:out value="${item.categoryName}"/>
                                        </option>
                                </c:forEach></td>
                        </tr>
                        <tr>
                            <td>Image</td>
                            <td><input type="file" name="imageFile"/></td>
                        </tr>
                        <tr>
                            <td>Expiration Date</td>
                            <td><input type="date" name="txtExpirationDate"/></td>
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
                            <td><input type="submit" name="btAction" value="Create Cake"/> <input type="reset" value="Reset"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </c:if>
    </body>
</html>
