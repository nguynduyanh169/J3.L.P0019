<%-- 
    Document   : guest_confirm_order
    Created on : Dec 1, 2021, 7:09:46 PM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enter Order's Info</title>
    </head>
    <body>
        <c:set var="error" value="${requestScope.ERROR}" />
        <h1>Please enter your information for order!</h1>
        <c:if test="${empty error}">
            <form action="cart" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="txtEmail" value="${param.txtEmail}"/></td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><input type="text" name="txtPhone" value="${param.txtPhone}"/></td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="txtAddress" value="${param.txtAddress}"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="action" value="Guest order"/> <input type="reset" value="Reset"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </c:if>
        <c:if test="${not empty error}">
            <form action="cart" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="txtEmail" value="${param.txtEmail}"/></td>
                                <c:if test="${not empty error.emailError}">
                                <td><font color="red">
                                    ${error.emailError}
                                    </font>
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td><input type="text" name="txtPhone" value="${param.txtPhone}"/></td>
                                <c:if test="${not empty error.phoneError}">
                                <td><font color="red">
                                    ${error.phoneError}
                                    </font>
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td><input type="text" name="txtAddress" value="${param.txtAddress}"/></td>
                                <c:if test="${not empty error.addressError}">
                                <td><font color="red">
                                    ${error.addressError}
                                    </font>
                                </td>
                            </c:if>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="action" value="Guest order"/> <input type="reset" value="Reset"/></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </c:if>
    </body>
</html>
