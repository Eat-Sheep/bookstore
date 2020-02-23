<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .order-body {
        width: 80%;
        margin-left: 10%;
        float: left;
    }

    .table-book {
        width: 100%;
        text-align: center;
        margin-left: -50px;
    }

    .jie {
        width: 100px;
        height: 50px;
        background-color: red;
        border: none;
        float: right;
        margin-right: 50px;
        margin-top: 50px;
    }
</style>

<body>

<div class="order-body">
    <table border="1" class="table-book">
        <tr>
            <th>商品</th>
            <th>数量</th>
            <th>价格</th>

        </tr>
        <c:forEach items="${cart}" var="tel">
            <tr>
                <td>${tel.cartName}</td>
                <td>${tel.ordermount}</td>
                <td>${tel.price}</td>

                <td class="cz">
                    <a href="deletebook?id=${book.bookId}">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="button" value="结算" class="jie">
</div>

</body>
</html>
