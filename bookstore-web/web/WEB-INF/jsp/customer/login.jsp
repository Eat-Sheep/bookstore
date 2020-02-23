<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/static/layui/css/login.css" media="all">
<body>

<div class="login">
    <div class="login-min">
        <form action="login" method="post">
            <input type="text" name="userTel" placeholder="请输入手机号码" class="tel"/><br/>
            <input type="password" id="txtPassword" name="userPwd" placeholder="请输入密码" class="pwd"/><br/>
            <a href="/register">还没有账号？点击注册</a>
            <input type="submit" value="登录" class="button" href="/code"/>
        </form>
    </div>
</div>
</body>
</html>
