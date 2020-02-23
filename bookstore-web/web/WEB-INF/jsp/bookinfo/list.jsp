<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/static/layui/css/bookinfo.css" media="all">
<script src="/static/js/jquery-3.3.1.min.js"></script>
<body>
<div class="body-top">
    <ul class="top-ul">
        <li>
            <div class="personal">
                个人信息
                <div class="personal-p">完善个人信息</div>
                <div class="personal-p">修改密码</div>
                <div class="personal-p">我的定单</div>
            </div>
        </li>
        <li><a href="/register">免费注册</a></li>
        <c:if test="${username==null}">
            <li><a href="/enterlogin">你好，请登录</a></li>
        </c:if>
        <c:if test="${username!=null}">
            <a href="/resit" style="float: right;font-size: 15px;margin-right: 15px;margin-top: 5px">注销</a>
            <li>你好，${username}</li>
        </c:if>

    </ul>
</div>
<div class="div-body">
    <div class="search">
        <div style="width: 160px;height: 75px;float:left;margin-top: 5px;margin-left: 30px; font-family:幼圆;font-size: 60px">
            书淘
        </div>
        <form method="get" action="/vague">
            <input type="text" class="search-text" placeholder="请输入你想要图书的信息" name="name">
            <input type="submit" value="搜索" class="search-button">
        </form>

        <div class="shopping">我的购物车 <i class="layui-icon layui-icon-cart-simple"></i></div>
    </div>
    <div class="classify">

    </div>


    <div class="layui-carousel" id="test1">
        <div carousel-item>
            <div><img src="/download?filename=b2.png"></div>
            <div><img src="/download?filename=b1.png"></div>
            <div><img src="/download?filename=b2.png"></div>
            <div><img src="/download?filename=b1.png"></div>
            <div><img src="/download?filename=b2.png"></div>
        </div>
    </div>

    <script src="/static/layui/layui.js" style="text-align: center"></script>
    <script>
        layui.use('carousel', function () {
            var carousel = layui.carousel;
            //建造实例
            carousel.render({
                elem: '#test1'
                , width: '60%' //设置容器宽度
                , arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });
    </script>
    <div class="div-img">
        <img src="/download?filename=5.png">
    </div>

    <div class="heat">
        精品推送
        <div class="heat-book">
            <div class="heat-p">
                <p>如果说,</p>
                <p>书是人类进步的阶梯</p>
                <p>那么,</p>
                <p>这些书,</p>
                <p>就是人类进步的电梯</p>
            </div>
            <div class="heat-div">
                <c:forEach items="${list.list}" var="book">
                    <a href="information?bookId=${book.bookId}">
                        <div class="book-div-huojia">
                            <div class="zhaopian">
                                <img src="/download?filename=${book.bookImg}">
                            </div>
                            <div class="shuming">
                                    ${book.bookName}
                            </div>
                            <div class="iaqian" style="color: red">
                                ￥ ${book.bookPrice}
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>

    </div>
    <%----------------------%>

    <div class="book">
        <c:forEach items="${list.list}" var="book">
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

    <div class="ranking">
        <p>图书推荐</p>
        <div class="div-ranking">
            <c:forEach items="${list.list}" var="book">
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
    </div>

</div>

<script>
    $(function () {
        $.ajax({
            url: "/type",
            method: "GET"
        }).done(function (res) {
            $(".classify").html(res);
        });
    });
</script>

</body>
</html>
