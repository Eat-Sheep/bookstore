<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/static/layui/css/register.css" media="all">
<body>
<div class="register">
    <div class="add-div">
        <form method="post" action="/customerinsert">
            <div>
                <input type="text" name="userName" placeholder="想一个入名称呗" class="add-text">
            </div>

            <div class="div-body">
                <div>
                    <input type="text" name="userTel" id="userTel" placeholder="留个电话号码吧" class="div-tel">
                    <div>
                        <input type="text" name="code" class="text-yanzhen" placeholder="验证码">
                        <input type="button" id="yanzhen" value="获取验证码">
                    </div>
                </div>
            </div>

            <div>
                <input type="password" name="userPwd" placeholder="密码请不要告诉别人" class="add-text">
            </div>

            <input type="submit" value="注册" class="button"/>

            <script>
                function yanZheng() {
                    $.ajax({
                        method: "GET",
                        url: "/verifications",
                        data: {
                            userTel: $(".div-tel").val()
                        }
                    }).done(function () {
                    })
                }
                $(function () {
                    $("#yanzhen").click(yanZheng);
                })
            </script>
        </form>
    </div>
</div>
</body>
</html>
