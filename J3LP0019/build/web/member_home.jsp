<%-- 
    Document   : member_home
    Created on : Nov 29, 2021, 8:35:02 AM
    Author     : anhnd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Home Page</title>
        <style>
            .container {
                display: flex;
                justify-content: center;
                flex-direction: column;
                align-items: center;
            }
        </style>
    </head>
    <body>
        <c:set var="cakes" value="${sessionScope.CAKES}" />
        <c:set var="totalPage" value="${sessionScope.TOTALPAGE}" />
        <c:set var="categories" value="${sessionScope.CATEGORIES}" />
        <c:set var="selectedCategoryId" value="${sessionScope.SELECTCATEGORY}"/>
        <form action="logout" method="POST">
            <input type="submit" value="Logout" name="btAction"/>
        </form>
        <div class="container">
            <h1>Welcome <c:out value="${sessionScope.ACCOUNT.fullName}"/>!</h1>
            <br/>
            <c:url var="viewCartLink" value="cart">
                <c:param name="action" value="View cart"/>
            </c:url>

            <a href="${viewCartLink}">View Cart</a>
            <br/>
            <form action="searchCake" method="GET">
                <input type="text" name="searchName" value="${param.searchName}"/> 
                <select name="categoryChoice">
                    <c:forEach var="item" items="${categories}">
                        <c:if test="${selectedCategoryId eq item.categoryId}">
                            <option value="${item.categoryId}" selected="true">
                                <c:out value="${item.categoryName}"/>
                            </option>
                        </c:if>
                        <c:if test="${selectedCategoryId eq item.categoryId == false}">
                            <option value="${item.categoryId}">
                                <c:out value="${item.categoryName}"/>
                            </option>
                        </c:if>
                    </c:forEach>
                </select>
                <input type="number" name="fromPrice" value="${param.fromPrice}"/> 
                <input type="number" name="toPrice" value="${param.toPrice}"/>
                <input type="hidden" name="urlForward" value="Search_Member"/>
                <input type="submit" name="btAction" value="Search"/>
            </form>
            <br/>
            <c:if test="${not empty cakes}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Create Date</th>
                            <th>Expiration Date</th>
                            <th>Type</th>
                            <td></td>
                        </tr>
                    </thead>
                    <c:forEach var="dto" items="${cakes}" varStatus="counter">
                        <tbody>
                            <tr>
                                <td>${dto.cakeName}</td>
                                <td><c:if test="${not empty dto.imgPath}">
                                        <img src="images/${dto.imgPath}" style="display:block; width:50px; height:50px;">
                                    </c:if>
                                    <c:if test="${empty dto.imgPath}">
                                        <img src="images/notfound.jpg" style="display:block; width:50px; height:50px;">
                                    </c:if></td>
                                <td>${dto.description}</td>
                                <td>${dto.quantity}</td>
                                <td>${dto.price}</td>
                                <td>${dto.createDate}</td>
                                <td>${dto.expirationDate}</td>
                                <c:forEach var="category" items="${categories}" varStatus="counter">
                                    <c:if test="${category.categoryId eq dto.categoryId}">
                                        <td>${category.categoryName}</td>
                                    </c:if>
                                </c:forEach>
                                <c:url var="addToCartLink" value="cart">
                                    <c:param name="cakeId" value="${dto.cakeId}"/>
                                    <c:param name="cakeName" value="${dto.cakeName}"/>
                                    <c:param name="price" value="${dto.price}"/>
                                    <c:param name="action" value="Add to cart"/>
                                </c:url>
                                <td><a href="${addToCartLink}">Add To Cart</a></td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${empty cakes}">
                <h1>No record is matched !!!</h1>
            </c:if>
            <div>
                <c:forEach begin="1" end="${totalPage}" var="i">
                    <c:url var="currentPageLink" value="searchCake">
                        <c:param name="page" value="${i}"/>
                        <c:param name="searchName" value="${param.searchName}"/>
                        <c:param name="fromPrice" value="${param.fromPrice}"/>
                        <c:param name="toPrice" value="${param.toPrice}"/>
                        <c:param name="categoryChoice" value="${sessionScope.SELECTCATEGORY}"/>
                        <c:param name="urlForward" value="Search_Member"/>
                    </c:url>
                    <a id="${i}" style="margin-bottom: 50px" href="${currentPageLink}">${i}</a>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
