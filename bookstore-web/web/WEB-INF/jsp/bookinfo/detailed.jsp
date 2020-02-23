<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    * {
        padding: 0px;
        margin: 0px;
    }

    .book-div-huojia {
        float: left;
        height: 275px;
        width: 190px;
        padding-top: 17px;
        padding-left: 17px;
    }

    .book-div-huojia:hover {
        box-shadow: #9F9F9F 1px 1px 50px;
        cursor: pointer
    }

    .zhaopian {
        height: 182px;
        width: 168px;

    }

    .shuming {
        height: 40px;
        width: 168px;
        text-align: left;
        word-wrap: break-word;
        word-break: break-all;
        overflow: hidden;
        margin-top: 10px;
        color: black;
    }

    .jiaqian {
        height: 25px;
        width: 168px;
        text-align: left;
        margin-top: 10px;
        color: #FD482C;
        border-top: none;
        font-size: 18px;
    }

    img {
        width: 100%;
        height: 100%;
    }

    .div-body {
        width: 80%;
        margin-left: 10%;
        margin-top: 50px;
    }

    #search {
        height: 51px;
        width: 100%;
        margin-top: 20px;
    }

    .search-text {
        height: 43px;
        width: 40%;
        margin-left: 25%;
    }

    .search-button {
        height: 44px;
        width: 5%;
        background-color: #93D1FF;
        margin-left: -6px;
        border: none;
    }
</style>
<body>
<div id="search">
    <form method="get" action="/vague">
        <input type="text" class="search-text" placeholder="请输入你想要图书的信息" name="name">
        <input type="submit" value="搜索" class="search-button">
    </form>
</div>
<div class="div-body">
    <c:forEach items="${vague}" var="book">
        <a href="information?bookId=${book.bookId}">
            <div class="book-div-huojia">
                <div class="zhaopian">
                    <img src="/download?filename=${book.bookImg}">
                </div>
                <div class="shuming">
                        ${book.bookName}
                </div>
                <div class="jiaqian" style="color: red">
                    ￥ ${book.bookPrice}
                </div>
            </div>
        </a>
    </c:forEach>
</div>
</body>
</html>
