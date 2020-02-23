<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<meta charset="utf-8">
<link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/static/layui/css/admin.css" media="all">
<script src="/static/js/jquery-3.3.1.min.js"></script>
<body>
<div class="div-top">
    <div id="div-shu">
        书淘管理
    </div>
    <div class="div-admin">
        <input type="button" class="div-admin-zhu" value="注销">
    </div>
</div>
<div class="div-side">

    <div class="side" id="chick-user">
        用户
    </div>
    <div class="side" id="chick-book">
        图书
    </div>
    <div class="side">
        订单信息
    </div>
</div>
<div class="zhuti">

</div>
<script>
    $.ajax({
        url: "/info",
        method: "GET"
    }).done(function (res) {
        $(".zhuti").html(res);
    });

    $("#chick-book").click(function () {
        $.ajax({
            url: "/info",
            method: "GET"
        }).done(function (res) {
            $(".zhuti").html(res);
        });
    })
</script>
<script>
    $("#chick-user").click(function () {
        $.ajax({
            url: "/query",
            method: "GET"
        }).done(function (res2) {
            $(".zhuti").html(res2);
        });
    })
</script>
</body>
</html>
