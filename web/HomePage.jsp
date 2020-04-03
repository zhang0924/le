<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>首页</title>
   <!-- <link rel="stylesheet" href="./css/semantic.min.css">-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">

</head>
<body>
<!--导航-->
<nav class="ui inverted vertical segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item animated rubberBand">Blog</h2>
            <a href="${pageContext.request.contextPath}/findBlogByPageServlet" class=" active m-item item   m-mobile-hide"><i class="home icon animated swing"></i> 首页</a>
            <a href="${pageContext.request.contextPath}/findTypeByPageServlet" class="m-item item m-mobile-hide" ><i class="idea icon"></i>分类</a>
            <a href="${pageContext.request.contextPath}/findTagByPageServlet" class="m-item item m-mobile-hide" ><i class="tags icon"></i>标签</a>
            <a href="${pageContext.request.contextPath}/findYearByPageServlet" class="m-item item m-mobile-hide" ><i class=" clone icon"></i>归档</a>
            <a href="${pageContext.request.contextPath}/about.jsp" class=" m-item item m-mobile-hide" ><i class="info icon"></i>关于我</a>
            <div class="right m-item item m-mobile-hide">
                <div class="ui icon inverted transparent input">
                    <input type="text" placeholder="Search..." name="title">
                        <i class="search link icon"></i>
                </div>
            </div>
            <div class="right m-item item m-mobile-hide">
                <c:if test="${sessionScope.userLogin==null}">
                <a href="${pageContext.request.contextPath}/htmls/login.jsp" class=" m-item item   m-mobile-hide"><i class="sign-in icon animated fadeInLeft"></i>登录</a>
                </c:if>
                <c:if test="${sessionScope.userLogin!=null}">
                  <div class="ui dropdown item">
                      <div class="text">
                          <img src="${sessionScope.userLogin.icon}" class="ui avatar image">
                          <c:if test="${sessionScope.userLogin.niname==null}">
                              ${sessionScope.userLogin.username}
                          </c:if>
                          <c:if test="${sessionScope.userLogin.niname!=null}">
                              ${sessionScope.userLogin.niname}
                          </c:if>
                      </div>
                    <!--<img src="../img/xl.png" style="width: 20px !important;">-->
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/htmls/secret.jsp" class="item">个人中心</a>
                        <a href="${pageContext.request.contextPath}/userExistServlet" class="item">注销</a>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
    </div>
<!--    折叠按钮-->
    <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
        <i class="sidebar icon"></i>
    </a>
</nav>
<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container"><!--容器-->
        <div class="ui stackable grid">
            <!--left左边博客列表-->
            <div class="eleven wide column animated fadeInLeft">
                <!--头部-->
                <div class="ui top attached segment">
                    <div class="ui middle aligned two column grid">
                        <div class="column">
                            <h3 class="ui teal header">博客</h3>
                        </div>
                        <div class="right aligned column">
                        共<h2 class="ui orange header m-inline-block m-text-thin">${pb.totalCount}</h2>篇
                        </div>
                    </div>
                </div>
                <!--文章列表.-->
                <div class="ui attached segment">
                    <c:forEach items="${pb.list}" var="blog" varStatus="s">
                    <div class="ui padded vertical segment m-padded-tb-large">
                        <div class="ui mobile reversed stackable grid">
                            <div class="eleven wide column">
                                <a href="${pageContext.request.contextPath}/acha?id=${blog.id}&uid=${sessionScope.userLogin.id}" >
                                <h3 class="ui header">${blog.title}</h3>
                                <p class="m-text" style="color: black!important;">
                                    ${blog.zy}.....
                                </p>
                                </a>
                                <div class="ui grid">
                                    <div class="eleven wide column">
                                        <div class="ui mini horizontal link list">
                                            <div class="item">
                                                <img src="${blog.icon}" class="ui avatar image">
                                                <div class="content"><a href="#" class="header">${blog.niname}</a> </div>
                                            </div>
                                            <div class="item">
                                                <i class="calendar icon"></i>${blog.datetime}
                                            </div>
                                            <div class="item">
                                                <i class="eye icon"></i>${blog.eye}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="right aligned five wide column">
                                        <a href="#" target="_blank" class="ui teal basic label m-padded-tiny m-text-thin"> 认知升级</a>
                                    </div>
                                </div>
                            </div>
                            <div class="five wide column">
                                <a href="#" target="_blank"><img src="${blog.indexPicture}" class="ui rounded image"></a>
                            </div>
                        </div>
                    </div>

                    </c:forEach>




                </div>
                <!--底部-->







                <div class="ui bottom attached segment">
                    <div class="ui middle aligned two column grid">
                    <c:if test="${pb.currentPage != 1}">
                        <div class="column">
                           <a href="${pageContext.request.contextPath}/findBlogByPageServlet?currentPage=${pb.currentPage - 1}&rows=8&title=${condition.title[0]}" class="ui mini teal basic button" aria-label="Previous">上一页</a>
                        </div>
                        </c:if>
                        <c:if test="${pb.currentPage == 1}">
                            <div class="column"></div>
                        </c:if>
                        <c:if test="${pb.currentPage != pb.totalPage}">
                        <div class="right aligned column">
                            <a href="${pageContext.request.contextPath}/findBlogByPageServlet?currentPage=${pb.currentPage + 1}&rows=8&title=${condition.title[0]}" class="ui mini teal basic button" aria-label="Next">下一页</a>
                        </div>
                        </c:if>
                    </div>
                </div>
                <div class="ui  mini pagination menu">


                    <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                        <c:if test="${pb.currentPage == i}">
                            <a class="active teal item" href="${pageContext.request.contextPath}/findBlogByPageServlet?currentPage=${i}&rows=8&title=${condition.title[0]}">${i}</a>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <a class="item" href="${pageContext.request.contextPath}/findBlogByPageServlet?currentPage=${i}&rows=8&title=${condition.title[0]}">${i}</a>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
            <!--right-右边分类列表-->
            <div class="five wide column">
                <div class="ui segments animated fadeInDown">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="idea teal icon"></i>分类
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank">more<i class="angle double right teal icon"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ui teal segment">
                        <div class="ui fluid vertical menu">
                            <c:forEach begin="1" end="5" var="i" >
                            <a href="${pageContext.request.contextPath}/findTypeByPageServlet?type=${i}" class="item">
                                <c:if test="${i==1}">笔记</c:if>
                                <c:if test="${i==2}">数据结构与算法</c:if><c:if test="${i==3}">知识分享</c:if><c:if test="${i==4}">思考与感悟</c:if><c:if test="${i==5}">其他</c:if>
                                <div class="ui teal basic left pointing label"><c:if test="${i==1}">${requestScope.typy1}</c:if>
                                    <c:if test="${i==2}">${requestScope.typy2}</c:if><c:if test="${i==3}">${requestScope.typy3}</c:if><c:if test="${i==4}">${requestScope.typy4}</c:if><c:if test="${i==5}">${requestScope.typy5}</c:if></div>
                            </a>

                            </c:forEach>

                        </div>
                    </div>
                </div>
                <!--标签-->
                <div class="ui segments m-margin-top-large animated fadeInRight">
                    <div class="ui secondary segment">
                        <div class="ui two column grid">
                            <div class="column">
                                <i class="tags teal icon"></i>标签
                            </div>
                            <div class="right aligned column">
                                <a href="#" target="_blank">more<i class="angle double right teal icon"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ui teal segment">
                        <c:forEach begin="1" end="5" var="i" >

                        <a href="${pageContext.request.contextPath}/findTagByPageServlet?tag=${i}"  class="ui teal basic left pointing label m-margin-tb-tiny"><c:if test="${i==1}">Java</c:if>
                            <c:if test="${i==2}">JavaSE</c:if><c:if test="${i==3}">JavaEE</c:if><c:if test="${i==4}">MySQL</c:if><c:if test="${i==5}">前端</c:if><div class="detail"><c:if test="${i==1}">${requestScope.tag1}</c:if>
                                <c:if test="${i==2}">${requestScope.tag2}</c:if><c:if test="${i==3}">${requestScope.tag3}</c:if><c:if test="${i==4}">${requestScope.tag4}</c:if><c:if test="${i==5}">${requestScope.tag5}</c:if></div>
                        </a>
                        </c:forEach>

                    </div>
                </div>
                <!--最新推荐-->
                <div class="ui segments m-margin-top-large animated fadeInUp">
                    <div class="ui secondary segment">
                        <i class="bullhorn teal  icon"></i>最新推荐
                    </div>
                    <c:forEach items="${news}" var="blog">
                    <div class="ui segment">
                    <a href="${pageContext.request.contextPath}/acha?id=${blog.id}&uid=${sessionScope.userLogin.id}" class="m-block m-text-thin">${blog.title}</a>
                </div>
                    </c:forEach>

                </div>

                <!--二维码-->
                <h4 class="ui horizontal divider header m-margin-top-large ">扫码关注我</h4>
                <div class="ui centered card" style="width: 11em">
                    <img src="${pageContext.request.contextPath}/img/erweima.png" class="ui rounded image" >
                </div>

            </div>
        </div>
    </div>
</div>
<br>
<br>

        <!-- 底部-->
<footer class="ui inverted vertical segment m-padded-tb-massive">
    <div class="ui center aligned container">
        <div class="ui inverted divided stackable grid">
                <div class="three wide column">
                    <div class="ui inverted link list">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/img/erweima.png" class="ui rounded image" alt="微信二维码" style="width: 110px">
                        </div>
                    </div>
                </div>
                <div class="three wide column">
                    <h4 class="ui inverted header  m-text-spaced m-text-thin">浏览最多</h4>
                    <div class="ui inverted link list">
                        <c:forEach items="${newss}" var="blog">
                        <a href="${pageContext.request.contextPath}/acha?id=${blog.id}&uid=${sessionScope.userLogin.id}" class="item">${blog.title}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="three wide column">
                    <h4 class="ui inverted header  m-text-spaced m-text-thin">联系我</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">Email:18595453787@163.com</a>
                        <a href="#" class="item">QQ：532325667</a>

                    </div>
                </div>
                <div class="seven wide column">
                    <h4 class="ui inverted header  m-text-spaced m-text-thin">Blog</h4>
                    <p class="m-opacity-mini m-text-spaced m-text-thin">这是我的个人博客，会分享关于编程、写作、思考相关的任何内容，希望可以给来到这儿的人有所帮助....</p>
                </div>
        </div>
        <div class="ui inverted section divider"></div>
        <p class="m-text-thin  m-opacity-mini" style="color:#8d8e8e ">
            <img src="${pageContext.request.contextPath}/img/ba.png" width="12px" height="12px"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002703" style="color:#8d8e8e ">豫公网安备 41019702002703号 </a><a href="http://beian.miit.gov.cn"  style="color:#8d8e8e "> 豫ICP备20006012号-1</a>
            <br/>Copyright &copy; 2020 zhanglele.club. All rights reserved.
        </p >
    </div>
</footer>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/semantic.min.js"></script>
<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });


    $('.ui.dropdown').dropdown({
        on : 'hover'
    });



    //设置定时器，1秒执行一次该方法

</script>
</body>
</html>