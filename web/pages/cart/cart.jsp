<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <%@ include file="/WEB-INF/include/base.jsp" %>
    <script type="text/javascript">
        $(function () {
            $(".del").click(function () {
                var title = $(this).prop("name");

                var rs = confirm("确定删除【" + title + "】本书吗?");
                if (rs == false) {
                    return false;
                }

            });

            $("#qwq").click(function () {
                var title = $(this).prop("name");

                var ss = confirm("确定删除" + title + "吗");
                if (ss == false) {
                    return false;
                }

            })


            $(".count-num").change(function () {
                var dvalue = this.defaultValue;
                //获取参数
                var bookId = $(this).prop("id");
                var newCount = $(this).val();
                9

                var regCount = /^\+?[1-9][0-9]*$/;

                if (regCount.test(newCount) == false) {
                    $(this).val(dvalue);
                    alert("输入数量不合法，请输入正整数")
                    return false;
                }
                //发送请求
                //     location = "CartServlet?method=updateCartltemCount&bookId=" + bookId + "&newCount=" + newCount;
                var url = "CartServlet?method=updateCartltemCount";
                var data ={"bookId":bookId,"newCount":newCount};
                var $input=$(this).parent().next().next();
                $.getJSON(url,data,function (rs) {
                    $input.html(rs.amount);
                    $("#tcount").html(rs.totalCount);
                    $("#tamount").html(rs.totalAmount);

                });
            });

            $("span[name='add']").click(function () {
                //实现购物项数量加1
                //获取bookId
                var $input = $(this).prev();
                var bookId = $input.attr("id");
                //找到购物项数量的对象
                var newCount = parseInt($input.val()) + 1;
                $input.val(newCount);
                location = "CartServlet?method=updateCartltemCount&bookId=" + bookId + "&newCount=" + newCount;
            });

            $("span[name='sub']").click(function () {
                //实现购物项数量加1
                //获取bookId
                var $input = $(this).next();
                var bookId = $input.attr("id");
                //找到购物项数量的对象

                var crCount = $input.val();
                if (crCount <= 1) {
                    alert("输入不能小于1")
                    return false;
                }
                var newCount = parseInt(crCount) - 1;
                $input.val(newCount);
                location = "CartServlet?method=updateCartltemCount&bookId=" + bookId + "&newCount=" + newCount;
            });
        });

    </script>

    <link rel="stylesheet" href="static/css/minireset.css"/>
    <link rel="stylesheet" href="static/css/common.css"/>
    <link rel="stylesheet" href="static/css/cart.css"/>
</head>
<body>

<div class="header">
    <div class="w">
        <div class="header-left">
            <a href="index.jsp">
                <img src="static/img/logo.gif" alt=""
                /></a>
            <h1>我的购物车</h1>
        </div>
        <div class="header-right">
            <%@include file="/WEB-INF/include/welcome.jsp" %>
        </div>
    </div>
</div>
<c:if test="${ empty sessionScope.cart.cartltems}">
    <div align="center" style="font-size:50px"><a href="index.jsp">去购物吧少年</a></div>
    </a></c:if>
<c:if test="${not empty sessionScope.cart.cartltems}">

    <div class="list">
        <div class="w">
            <table>
                <thead>
                <tr>
                    <th>图片</th>
                    <th>商品名称</th>

                    <th>数量</th>
                    <th>单价</th>
                    <th>金额</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cartItem" items="${sessionScope.cart.cartltems}">
                    <tr>
                        <td>
                            <img src="${cartItem.book.img_path}" alt=""/>
                        </td>
                        <td>${cartItem.book.title}</td>
                        <td>
                            <span name="sub" class="count">-</span>
                            <input class="count-num" id="${cartItem.book.id}" type="text" value="${cartItem.count}"/>
                            <span class="count" name="add">+</span>
                        </td>
                        <td>${cartItem.book.price}</td>
                        <td>${cartItem.amount}</td>
                        <td><a id="${cartItem.book.id}"
                               href="CartServlet?method=delCartltemById&bookId=${cartItem.book.id}"
                               name="${cartItem.book.title}" class="del">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="footer">
                <div class="footer-left">
                    <a id="qwq" href="CartServlet?method=clearCart" class="clear-cart">清空购物车</a>
                    <a href="index.jsp">继续购物</a>
                </div>
                <div class="footer-right">
                    <div>共<span id="tcount">${sessionScope.cart.totalCount}</span>件商品</div>
                    <div  class="total-price">总金额<span id="tamount">${sessionScope.cart.totalAmount}</span>元</div>
                    <a class="pay" href="OrderServlet?method=checkout">去结账</a>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="w">
            <div class="top">
                <ul>
                    <li>
                        <a href="">
                            <img src="static/img/bottom1.png" alt=""/>
                            <span>大咖级讲师亲自授课</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="static/img/bottom.png" alt=""/>
                            <span>课程为学员成长持续赋能</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="static/img/bottom2.png" alt=""/>
                            <span>学员真是情况大公开</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="content">
                <dl>
                    <dt>关于尚硅谷</dt>
                    <dd>教育理念</dd>
                    <!-- <dd>名师团队</dd>
                    <dd>学员心声</dd> -->
                </dl>
                <dl>
                    <dt>资源下载</dt>
                    <dd>视频下载</dd>
                    <!-- <dd>资料下载</dd>
                    <dd>工具下载</dd> -->
                </dl>
                <dl>
                    <dt>加入我们</dt>
                    <dd>招聘岗位</dd>
                    <!-- <dd>岗位介绍</dd>
                    <dd>招贤纳师</dd> -->
                </dl>
                <dl>
                    <dt>联系我们</dt>
                    <dd>http://www.atguigu.com</dd>
                    <dd></dd>
                </dl>
            </div>
        </div>
        <div class="down">
            尚硅谷书城.Copyright ©2015
        </div>
    </div>
</c:if>
</body>
</html>
