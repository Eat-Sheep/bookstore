<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/static/layui/css/add.css" media="all">
<body>
<div class="add-div">
    <form method="post" action="/bookinsert">
        <div>
            <input type="text" name="bookTypeId" placeholder="类型" class="add-text">
        </div>
        <div>
            <input type="text" name="bookName" placeholder="书名" class="add-text">
        </div>
        <div>
            <input type="text" name="bookAuthor" placeholder="作者" class="add-text">
        </div>
        <div>
            <input type="text" name="bookPress" placeholder="出版社" class="add-text">
        </div>
        <div>
            <input type="text" name="bookPrice" placeholder="价钱" class="add-text">
        </div>
        <div>
            <input type="text" name="bookStoremount" placeholder="数量" class="add-text">
        </div>
        <div>
            <input type="file" name="bookImg" class="file">
        </div>
        <input type="submit" value="添加" class="submit"/>
    </form>
</div>
</body>
</html>
