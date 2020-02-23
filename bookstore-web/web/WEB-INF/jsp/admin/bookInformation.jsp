<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .admin-book {
        width: 1150px;
        height: 550px;
    }

    .table-book {
        width: 1150px;
        height: 550px;
        text-align: center;
    }

    .cz {
        cursor: pointer;
    }
</style>
<div class="admin-book">
    <table border="1" class="table-book">
        <tr>
            <th>编号</th>
            <th>类型</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>价钱</th>
            <th>库存</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${list.list}" var="book">
            <tr>
                <td>${book.bookId}</td>
                <td>${book.bookTypeId}</td>
                <td>${book.bookName}</td>
                <td>${book.bookPress}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPrice}</td>
                <td>${book.bookStoremount}</td>
                <td class="cz">
                    <a href="deletebook?id=${book.bookId}">删除</a>
                </td>
                <td class="cz">
                    <a href="check?bookId=${book.bookId}">修改</a>
                </td>
                <td class="cz"><a href="add">添加</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

