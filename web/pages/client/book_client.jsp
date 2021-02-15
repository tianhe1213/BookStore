<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>书城首页</title>
<%--    <base href="<%=request.getContextPath()%>/">--%>
    <%@ include file="/WEB-INF/include/base.jsp"%>

    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/iconfont.css" />
    <link rel="stylesheet" href="static/css/index.css" />
    <link rel="stylesheet" href="static/css/swiper.min.css" />
    <script>
      $(function () {
        $("#ss").click(function (){
        //获取参数
        var pNo =$("#pNo").val();
        //发送请求
        location.href="BookClientServlet?method=getAllBooksByPage&pageNo="+pNo;

        })
        //实现book到购物车中的功能
        $(".list-content button").click(function () {
          //获取bookid
          var bookId =$(this).attr("id");
          location="CartServlet?method=addBookToCart&bookId="+bookId;

        })
        $(".price-search button").click(function () {
          //获取参数
          var pageNo =$("#pNo").val();
          var min =$("#min").val();
          var max =$("#max").val();

          //发送请求
          // location="BookClientServlet?method=getAllBooksPagesAndPrice&pageNo="+pageNo+"&min"+min+"&max"+max;
          location = "BookClientServlet?method=getAllBooksByPageAndPrice&pageNo="+pageNo
                  +"&min="+min+"&max="+max;
        });
      });




    </script>
  </head>
  <body>
    <div id="app">
      <div class="topbar">
        <div class="w">
          <div class="topbar-left">
            <i>送至:</i>
            <i>北京</i>
            <i class="iconfont icon-ai-arrow-down"></i>
          </div>
          <div class="topbar-right">
            <a href="pages/user/login.jsp" class="login">登录</a>
            <a href="pages/user/regist.jsp" class="register">注册</a>
            <a
              href="pages/cart/cart.jsp"
              class="cart iconfont icon-gouwuche
			"
            >
              购物车
              <c:if test="${not empty sessionScope.cart.totalCount and sessionScope.cart.totalCount>0}">
              <div class="cart-num">${sessionScope.cart.totalCount}</div>
              </c:if>
            </a>
<%--            <a href="BooksServlet?method=getAllBooksByPage&pageNo=1" class="admin">后台管理</a>--%>
            <a href="${pageContext.request.contextPath}/Backstagemanagement">后台管理</a>
          </div>

<!--          登录后风格-->
<!--          <div class="topbar-right">-->
<!--            <span>欢迎你<b>张总</b></span>-->
<!--            <a href="#" class="register">注销</a>-->
<!--            <a-->
<!--                    href="pages/cart/cart.jsp"-->
<!--                    class="cart iconfont icon-gouwuche-->
<!--			">-->
<!--              购物车-->
<!--              <div class="cart-num">3</div>-->
<!--            </a>-->
<!--            <a href="pages/manager/book_manager.jsp" class="admin">后台管理</a>-->
<!--          </div>-->
        </div>
      </div>
      <div class="header w">
        <a href="#" class="header-logo"></a>
        <div class="header-nav">
          <ul>
            <li><a href="#">java</a></li>
            <li><a href="#">前端</a></li>
            <li><a href="#">小说</a></li>
            <li><a href="#">文学</a></li>
            <li><a href="#">青春文学</a></li>
            <li><a href="#">艺术</a></li>
            <li><a href="#">管理</a></li>
          </ul>
        </div>
        <div class="header-search">
          <input type="text" placeholder="十万个为什么" />
          <button class="iconfont icon-search"></button>
        </div>
      </div>
      <div class="banner w clearfix">
        <div class="banner-left">
          <ul>
            <li>
              <a href="">
                <span>文学 鉴赏</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>社科 研究</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>少儿 培训</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>艺术 赏析</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>生活 周边</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>文教 科技</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
            <li>
              <a href="">
                <span>热销 畅读</span>
                <i class="iconfont icon-jiantou"></i
              ></a>
            </li>
          </ul>
        </div>
        <div class="banner-right">
          <div class="swiper-container">
            <ul class="swiper-wrapper">
              <li class="swiper-slide">
                <img src="static/uploads/banner4.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
              <li class="swiper-slide">
                <img src="static/uploads/banner5.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
              <li class="swiper-slide">
                <img src="static/uploads/banner6.jpg" alt="">
                <!-- <div class="banner-img"></div> -->
              </li>
            </ul>
            <div class="swiper-button-prev"></div>

            <div class="swiper-button-next"></div>

            <!-- Add Pagination -->
            <div class="swiper-pagination"></div>
          </div>
        </div>
      </div>
      <div class="books-list">
        <div class="w">
          <div class="list">
            <div class="list-header">
              <div class="title">图书列表</div>
              <div class="price-search">
                <span>价格:</span>
                <input type="text" id="min" value="${param.min}">
                <span>-元</span>
                <input type="text" id="max" value="${param.max}">
                <span>元</span>
                <button>查询</button>
              </div>
            </div>
              <div class="list-content">
              <c:forEach items="${requestScope.page}" var="book">
              <div class="list-item">
                <img src="${book.img_path}" alt="">
                <p>书名:${book.title}</p>
                <p>作者:${book.author}</p>
                <p>价格:${book.price}</p>
                <p>销量:${book.sales}</p>
                <p>库存:${book.stock}</p>
                <button id="${book.id}">加入购物车</button>
              </div>
              </c:forEach>
              </div>
<%--            <c:choose>--%>
<%--              <c:when test="${page.totalPageNo<5}">--%>
<%--                <c:set var="begin" value="1"></c:set>--%>
<%--                <c:set var="end" value="${page.totalPageNo}"></c:set>--%>
<%--              </c:when>--%>
<%--              <c:when test="${page.pageNo<=3}">--%>
<%--                <c:set var="begin" value="1"></c:set>--%>
<%--                <c:set var="end" value="5"></c:set>--%>
<%--              </c:when>--%>
<%--              <c:when test="${page.pageNo>3&&page.pageNo<=page.totalpageNo-2}">--%>
<%--                <c:set var="begin" value="${page.pageNo-2}"></c:set>--%>
<%--                <c:set var="end" value="${page.pageNo+2}"></c:set>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <c:set var="begin" value="${page.totalpageNo-4}"></c:set>--%>
<%--                <c:set var="end" value="${page.totalpageNo}"></c:set>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
            <c:choose>
              <c:when test="${page.totalpageNo<5}">
                <c:set var="begin" value="1"></c:set>totalpageNo
                <c:set var="end" value="${page.totalpageNo}"></c:set>
              </c:when>
              <c:when test="${page.pageNo<=3}">
                <c:set var="begin" value="1"></c:set>
                <c:set var="end" value="5"></c:set>
              </c:when>
              <c:when test="${page.pageNo>3 && page.pageNo<=page.totalpageNo-2}">
                <c:set var="begin" value="${page.pageNo-2}"></c:set>
                <c:set var="end" value="${page.pageNo+2}"></c:set>
              </c:when>
              <c:otherwise>
                <c:set var="begin" value="${page.totalpageNo-4}"></c:set>
                <c:set var="end" value="${page.totalpageNo}"></c:set>
              </c:otherwise>
            </c:choose>
            <div class="list-footer">
              <a href="BookClientServlet?method=getAllBooksByPage&pageNo=1">首页</a>
              <c:if test="${requestScope.page.pageNo>1}">
                <a href="BookClientServlet?method=getAllBooksByPage&pageNo=${requestScope.page.pageNo-1}">上一页</a>
              </c:if>
                <ul>
                  <c:forEach var="num" begin="${begin}" end="${end}">
                    <c:if test="${requestScope.page.pageNo==num}">
                  <li class="active"><a href="BookClientSaervlet?method=getAllBooksByPage&pgeNo=${num}">${num}</a></li>
                    </c:if>
                    <c:if test="${requestScope.page.pageNo!=num}">
                    <li><a href="BookClientServlet?method=getAllBooksByPage&pageNo=${num}">${num}</a></li>
                    </c:if>
                  </c:forEach>
                </ul>
              <c:if test="${requestScope.page.pageNo<requestScope.page.totalpageNo}">
                <a href="BookClientServlet?method=getAllBooksByPage&pageNo=${requestScope.page.pageNo+1}">下一页</a>
              </c:if >
              <a href="BookClientServlet?method=getAllBooksByPage&pageNo=${requestScope.page.totalpageNo}">末页</a>
              <span>共有${requestScope.page.totalpageNo}页</span>
                <span>${requestScope.page.totalRecord}条数据</span>
                <span>到第</span>
              <input id="pNo" type="text" value="${requestScope.page.pageNo}"/>
                <button id="ss">确定</button>
            </div>
          </div>
        </div>

      </div>
      <div class="cate w">
        <div class="list">
          <a href="" class="list-item">
            <i class="iconfont icon-java"></i>
            <span>java</span>
          </a>
          <a href="" class="list-item"
            ><i class="iconfont icon-h5"></i>h5</a
          >
          <a href="" class="list-item">
            <i class="iconfont icon-python"></i>python
          </a>
          <a href="" class="list-item"
            ><i class="iconfont icon-tianchongxing-"></i>pm</a
          >
          <a href="" class="list-item"
            ><i class="iconfont icon-php_elephant"></i>php</a
          >
          <a href="" class="list-item"
            ><i class="iconfont icon-go"></i>go</a
          >
        </div>
        <a href="" class="img">
          <img src="static/uploads/cate4.jpg" alt="" />
        </a>
        <a href="" class="img">
          <img src="static/uploads/cate5.jpg" alt="" />
        </a>
        <a href="" class="img">
          <img src="static/uploads/cate6.jpg" alt="" />
        </a>
      </div>
      <div class="books">
        <div class="w">
          <div class="seckill">
            <div class="seckill-header">
              <div class="title">
                图书秒杀
              </div>
              <!-- <i class="iconfont icon-huanyipi"></i> -->
            </div>
            <div class="seckill-content">

                  <a href="" class="tip">
                     <h5>距离结束还有</h5>
                     <i class="iconfont icon-shandian"></i>
                     <div class="downcount">
                      <span class="time">00</span>
                      <span class="token">:</span>
                      <span class="time">00</span>
                      <span class="token">:</span>
                      <span class="time">00</span>
                     </div>
                  </a>


                  <a href="" class="books-sec">
                    <img src="static/uploads/congwanqingdaominguo.jpg" alt="">
                    <p>从晚晴到民国</p>
                    <div>
                      <span class="cur-price">￥28.9</span>
                      <span class="pre-price">￥36.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="static/uploads/cyuyanrumenjingdian.jpg" alt="">
                    <p>c语言入门经典</p>
                    <div>
                      <span class="cur-price">￥55.9</span>
                      <span class="pre-price">￥68.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="static/uploads/fusang.jpg" alt="">
                    <p>扶桑</p>
                    <div>
                      <span class="cur-price">￥30.9</span>
                      <span class="pre-price">￥47.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
                  <a href="" class="books-sec">
                    <img src="static/uploads/geihaizideshi.jpg" alt="">
                    <p>给孩子的诗</p>
                    <div>
                      <span class="cur-price">￥18.9</span>
                      <span class="pre-price">￥25.5</span>
                    </div>
                    <button>立即购买</button>
                  </a>
              </ul>
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
                  <img src="static/img/bottom1.png" alt="">
                  <span>大咖级讲师亲自授课</span>
                </a>
              </li>
              <li>
                <a href="">
                  <img src="static/img/bottom.png" alt="">
                  <span>课程为学员成长持续赋能</span>
                </a>
              </li>
              <li>
                <a href="">
                  <img src="static/img/bottom2.png" alt="">
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
              <dd>http://www.atguigu.com<dd>
            </dl>
          </div>
        </div>
        <div class="down">
          尚硅谷书城.Copyright ©2015
        </div>
      </div>


    </div>
    <script src="static/script/swiper.min.js"></script>
    <script>
      var swiper = new Swiper('.swiper-container', {
        autoplay: true,
        pagination: {
          el: '.swiper-pagination',
          dynamicBullets: true
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        }
      })
    </script>
  </body>
</html>
