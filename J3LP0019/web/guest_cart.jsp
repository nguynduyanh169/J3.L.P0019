<%-- 
    Document   : guest_cart
    Created on : Dec 1, 2021, 7:04:31 PM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart Page</title>
    </head>
    <body>
        <h1>Your Shopping Cart!</h1>
        <c:set var="shop" value="${sessionScope.SHOP}"/>
        <c:set var="errorMsg" value="${requestScope.QUANTITYERROR}"/>
        <c:if test="${not empty shop}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="rows" items="${shop}">
                        <tr>
                            <td>${rows.value.cakeName}</td>
                            <td><form action="cart" method="POST">
                                    <input type="hidden" name="cakeId" value="${rows.value.cakeId}"/>
                                    <input type="number" name="txtQuantity" min="1" required value="${rows.value.quantity}">
                                    <input type="submit" value="Update" name="action"/> <input type="submit" value="Remove" name="action"/></form></td>

                            <td>${rows.value.price}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td><form action="cart" method="POST"><input type="submit" value="Order" name="action"/></form></td>
                    </tr>

                </tbody>
            </table>
        </c:if>
    <c:if test="${empty shop}">
        <h1>No Item !!!</h1>
    </c:if>

    <c:if test="${not empty errorMsg}">
        <h1>${errorMsg}</h1>
    </c:if>
</body>
</html>
