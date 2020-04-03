<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>博客列表</title>
   <!-- <link rel="stylesheet" href="../css/semantic.min.css">-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">
    <script>
        function back() {
            var history = window.history;
            history.back();

        }
    </script>
</head>
<body>
<!--导航-->
<nav class="ui inverted vertical segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">管理后台</h2>
            <a href="${pageContext.request.contextPath}/findBlogsByPageServlet" class="  m-item item   m-mobile-hide"><i class="home icon"></i> 博客</a>

            <a href="${pageContext.request.contextPath}/findUserByPageServlet" class="active m-item item m-mobile-hide" ><i class="address book icon"></i>管理用户</a>
            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="${sessionScope.useroot.icon}" class="ui avatar image">
                        ${sessionScope.useroot.niname}
                    </div>
                   <!-- <img src="../img/xl.png" style="width: 20px !important;">-->
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a href="${pageContext.request.contextPath}/existServlet" class="item">注销</a>
                    </div>
                </div>
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

            <a href="#" class="teal active item">添加用户</a>
        </div>

    </div>
</div>
<!--中间内容-->
<div class="m-container-small m-padded-tb-big">
    <div class="ui form">

        <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
            <div class="field">
                <label for="username">用户名：</label>
                <input type="text"  id="username" name="username" placeholder="请输入用户名">
            </div>

            <div class="field">
                <label for="password">密码：</label>
                <input type="text"  id="password" name="password" placeholder="请输入密码">
            </div>

            <div class="field">
                <label for="email">Email：</label>
                <input type="text"  id="email" name="email" placeholder="请输入邮箱地址"/>
            </div>

            <div class=" fields" >
                <input class="ui right floated teal button" type="submit" value="提交" />
                <input class="ui right floated black button" type="reset" value="重置" />
                <input class="ui right floated blue button" type="button" value="返回" onclick="back()" />
            </div>
        </form>
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
                    <h4 class="ui inverted header  m-text-spaced m-text-thin">最新博客</h4>
                    <div class="ui inverted link list">
                        <a href="#" class="item">用户故事(User Story)</a>
                        <a href="#" class="item">用户故事(User Story)</a>
                        <a href="#" class="item">用户故事(User Story)</a>
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
        on:'hover'
    });
</script>
</body>
</html>