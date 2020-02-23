<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .tian {
        width: 100%;
        height: 150px;
        background-color: #9F9F9F;
    }

    .zhi {
        width: 90%;
        float: right;
        height: 50px;
        color: #00FF00;
        font-size: 20px;
    }

    .xian {
        width: 90%;
        height: 100px;
        float: right;
    }

    .div-shopping {
        width: 200px;
        height: 45px;
        float: right;
        margin-top: -65px;
        margin-right: 20px;
    }
</style>
<body>
<div class="tian">
    <form method="post" action="/tel">
        <div class="zhi">
            商品已成功添加购物车
        </div>
        <div class="xian">
            <div class="shu">
                商品: ${cart.cartName}
            </div>
            <br>
            <div class="shuli">
                数量: ${cart.ordermount}
            </div>
            <div>
                <input type="submit" value="查看购物车" class="div-shopping">
            </div>
        </div>
    </form>
</div>
</body>
</html>
