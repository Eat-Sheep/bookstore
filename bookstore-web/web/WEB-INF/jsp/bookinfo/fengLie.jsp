<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="classify-1">
    <p>图书分类</p>
    <c:forEach items="${type}" var="book">
        <ul>
            <li><a>${book.bookTypeName}</a></li>
        </ul>
    </c:forEach>
</div>