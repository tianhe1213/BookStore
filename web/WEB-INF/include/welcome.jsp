<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${not empty sessionScope.user}">

<h3>欢迎<span>${sessionScope.user.username}</span>光临尚硅谷书城</h3>
<div class="order"><a href="pages/order/order.jsp">我的订单</a></div>
<div class="destory"><a href="UserServlet?method=out">注销</a></div>

</c:if>
<div class="gohome">
    <a href="index.jsp">返回</a>
</div>


