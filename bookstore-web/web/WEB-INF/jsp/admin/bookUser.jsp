<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .admin-user {
        width: 1150px;
        height: 550px;
        border: #FFFF00 solid 1px;
    }

    .table-user {
        width: 1150px;
        height: 550px;
        text-align: center;
    }
</style>

<div class="admin-user">
    <table border="1" class="table-user">
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>电话号码</th>
            <th>密码</th>
            <th>地址</th>
            <th>注册时间</th>
        </tr>
        <c:forEach items="${query.list}" var="query">
            <tr>
                <td>${query.userId}</td>
                <td>${query.userName}</td>
                <td>${query.userTel}</td>
                <td>${query.userPwd}</td>
                <td>${query.userAddr}</td>
                <td>${query.userTime}</td>
            </tr>
        </c:forEach>
    </table>
</div>
