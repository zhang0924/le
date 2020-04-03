<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>我的收藏</title>
   <!-- <link rel="stylesheet" href="../css/semantic.min.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">
</head>
<body>
<!--导航-->
<nav class="ui inverted vertical segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item animated fadeInDown">个人中心</h2>
            <a href="${pageContext.request.contextPath}/findBlogByPageServlet" class="m-item item   m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="${pageContext.request.contextPath}/findTypeByPageServlet" class=" m-item item m-mobile-hide" ><i class="idea icon"></i>分类</a>
            <a href="${pageContext.request.contextPath}/findTagByPageServlet" class="m-item item m-mobile-hide" ><i class="tags icon"></i>标签</a>
            <a href="${pageContext.request.contextPath}/findYearByPageServlet" class="m-item item m-mobile-hide" ><i class="clone icon"></i>归档</a>
            <a href="${pageContext.request.contextPath}/about.jsp" class=" m-item item m-mobile-hide" ><i class="info icon"></i>关于我</a>


            <div class="right m-item item m-mobile-hide">
                <c:if test="${sessionScope.userLogin==null}">
                    <a href="${pageContext.request.contextPath}/htmls/login.jsp" class=" m-item item   m-mobile-hide"><i class="sign-in icon"></i>登录</a>
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
<div class="ui attached pointing menu">
    <div class="ui container">
        <div class="right menu">

            <a href="${pageContext.request.contextPath}/htmls/secret.jsp" class=" item">我的信息</a>
            <a href="${pageContext.request.contextPath}/addscang?id=${sessionScope.userLogin.id}" class="teal active item animated swing">收藏</a>
        </div>

    </div>
</div>
<!--中间内容-->
<div class="m-container-small m-padded-tb-big animated fadeInRight">
    <div class="ui container">



        <div class="ui fluid vertical menu">
            <c:forEach items="${scang}" var="scang">
                <a href="${pageContext.request.contextPath}/acha?id=${scang.id}&uid=${sessionScope.userLogin.id}"  class="item">
                    <span><i class=" teal star icon"></i> ${scang.title}</span>
                <div class="ui teal label m-padded-miniP">收藏</div>
              <div class="ui orange basic  label m-padded-miniP">${scang.datetime}</div>

                </a>
            </c:forEach>

        </div>


    </div>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br><br>
<br>
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
            <img src="${pageContext.request.contextPath}/img/ba.png" width="12px" height="12px"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002703" style="color:#8d8e8e ">豫公网安备 41019702002703号 </a><a href="http://beian.miit.gov.cn" style="color:#8d8e8e "> 豫ICP备20006012号-1</a>
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
        on:'hover'
    });
</script>
</body>
</html>