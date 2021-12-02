<%-- 
    Document   : view_order
    Created on : Dec 1, 2021, 12:17:10 PM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Order</title>
    </head>
    <body>
        <c:set var="order" value="${requestScope.ORDER}" />
        <c:set var="orderDetails" value="${requestScope.ORDERDETAILS}" />
        <c:set var="pay" value="${requestScope.PAYMENT}" />
        <h1>Your Order!</h1>
        <p>Id: ${order.orderId}</p>
        <p>Account: ${order.orderBy}</p>
        <p>Ship Address: ${order.shipAddress}</p>
        <p>Phone: ${order.phone}</p>
        <c:if test="${order.status eq -1 == true}">
            <p>Status: Canceled</p>
        </c:if>
        <c:if test="${order.status eq 0 == true}">
            <p>Status: Ordered</p>
        </c:if>
        <c:if test="${order.status eq 1 == true}">
            <p>Status: Completed</p>
        </c:if>
        <p>Payment Method: ${pay.method}</p>
        <c:if test="${pay.status eq -1 == true}">
            <p>Payment Status: Failed</p>
        </c:if>
        <c:if test="${pay.status eq 0 == true}">
            <p>Payment Status: Not Completed</p>
        </c:if>
        <c:if test="${pay.status eq 1 == true}">
            <p>Payment Status: Completed</p>
        </c:if>
        <br/>
        <table border="1">
            <thead>
                <tr>
                    <th>Cake Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dto" items="${orderDetails}" varStatus="counter">
                    <tr>
                        <td>${dto.cakeName}</td>
                        <td>${dto.quantity}</td>
                        <td>${dto.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
        <a style="margin-bottom: 50px" href="${pageContext.request.contextPath}/searchCake?&searchName=&fromPrice=&toPrice=&urlForward=Search_Member">Back To Home</a>
    </body>
</html>
