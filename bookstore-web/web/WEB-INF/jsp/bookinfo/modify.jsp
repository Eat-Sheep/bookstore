<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/static/layui/css/modify.css" media="all">
<body>
<div class="add-div">
    <form method="post" action="/edit">
        <div style="display: none">
            <input type="text" name="bookId" value="${bookInfo1.bookId}"/>
        </div>
        <div>
            <input type="text" name="bookTypeId" placeholder="类型" class="modify-text" value="${bookInfo1.bookTypeId}">
        </div>
        <div>
            <input type="text" name="bookName" placeholder="书名" class="modify-text" value="${bookInfo1.bookName}">
        </div>
        <div>
            <input type="text" name="bookAuthor" placeholder="出版社" class="modify-text" value="${bookInfo1.bookAuthor}">
        </div>
        <div>
            <input type="text" name="bookPress" placeholder="作者" class="modify-text" value="${bookInfo1.bookPress}">
        </div>
        <div>
            <input type="text" name="bookPrice" placeholder="价钱" class="modify-text" value="${bookInfo1.bookPrice}">
        </div>
        <div>
            <input type="text" name="bookStoremount" placeholder="数量" class="modify-text" value="${bookInfo1.bookStoremount}">
        </div>
        <div>
            <input type="file" name="bookImg" class="file">
        </div>
        <input type="submit" value="修改" class="submit"/>
    </form>
</div>
</body>
</html>
