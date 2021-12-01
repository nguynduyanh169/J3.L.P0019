<%-- 
    Document   : cart
    Created on : Nov 30, 2021, 7:43:15 PM
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
        <c:if test="${not empty shop}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                <form action="cart" method="POST">
                    <c:forEach var="rows" items="${shop}">
                        <tr>
                            <td>${rows.value.cakeId}</td>
                            <td><input type="number" name="txtQuantity${rows.value.cakeId}" min="1" required value="${rows.value.quantity}"></td>
                            <td>${rows.value.price}</td>
                            <td>
                                <input type="hidden" name="cakeId" value="${rows.value.cakeId}"/>
                                <input type="submit" value="Update" name="action"/>
                            </td>
                            <td>
                                <input type="checkbox" name="rmv" value="${rows.value.cakeId}" />
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><input type="submit" value="Remove" name="action"/></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                        <td><input type="submit" value="Order" name="action"/></td>
                    </tr>
                </form>
            </tbody>
        </table>

    </c:if>
    <c:if test="${empty shop}">
        <h1>No Item !!!</h1>
    </c:if>
</body>
</html>
