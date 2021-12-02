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
        <script>
            function confirmDelete(button) {
                var href = button.getAttribute("href");
                console.log(href);
                var result = confirm("Delete this cake out of your cart?");

                if (result) {
                    window.location.href = href;
                } else {
                    return false;
                }
            }
        </script>
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
                            <td><form action="cart" method="GET">
                                    <input type="hidden" name="cakeId" value="${rows.value.cakeId}"/>
                                    <input type="number" name="txtQuantity" min="1" required value="${rows.value.quantity}">
                                    <input type="submit" value="Update" name="action"/> 
                                    <button href="${pageContext.request.contextPath}/CartServlet?action=Remove&cakeId=${rows.value.cakeId}" onclick="return confirmDelete(this)" name="action" value="Remove" >Remove</button></form></td>

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
