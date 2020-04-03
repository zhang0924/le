<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>博客列表</title>
   <!-- <link rel="stylesheet" href="../css/semantic.min.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">
    <script>
    function deleteUser(id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/delUserServlet?id="+id;
        }
    }

    window.onload = function(){
        //给删除选中按钮添加单击事件
        document.getElementById("delSelected").onclick = function(){


            var flag = false;
            //判断是否有选中条目
            var cbs = document.getElementsByName("uid");
            for (var i = 0; i < cbs.length; i++) {
                if(cbs[i].checked){
                    //有一个条目选中了
                    flag = true;
                    break;
                }
            }

            if(flag){//有条目被选中
                //表单提交
                if(confirm("您确定要删除选中条目吗？")) {
                    document.getElementById("form").submit();
                }
            }else {
                alert("你啥都没选，让我咋给你提交呀！");

            }

        }
        //1.获取第一个cb
        document.getElementById("firstCb").onclick = function(){
            //2.获取下边列表中所有的cb
            var cbs = document.getElementsByName("uid");
            //3.遍历
            for (var i = 0; i < cbs.length; i++) {
                //4.设置这些cbs[i]的checked状态 = firstCb.checked
                cbs[i].checked = this.checked;

            }

        }


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

            <a href="${pageContext.request.contextPath}/findUserByPageServlet" class=" active m-item item m-mobile-hide" ><i class="address book icon"></i>管理用户</a>
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

            <a  class="teal active item">用户信息列表</a>
        </div>

    </div>
</div>
<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <form class="ui secondary segment form" action="${pageContext.request.contextPath}/findUserByPageServlet" method="post">
            <div class="inline fields">
                <div class="field">
                <input type="text" name="username" value="${condition.username[0]}" placeholder="用户名">
                </div>
                <div class="field">
                    <div class="ui selection dropdown">
                        <input type="hidden" name="sex">
                        <div class="default text">性别</div>
                        <i class="dropdown icon"></i>
                        <div class="menu">
                            <div class="item" data-value="男">男</div>
                            <div class="item" data-value="女">女</div>
                        </div>
                    </div>
                </div>
                <input type="submit" class="ui mini teal basic button"  value="搜索">
              <%--  <button class="ui mini teal basic button"><i class="search icon"></i>搜索</button>--%>


                <a href="${pageContext.request.contextPath}/admin/add.jsp" class="ui mini  teal button" style="margin-left: 310px!important;">添加用户</a>
                <a href="javascript:void(0);" id="delSelected" class="ui mini  teal button" >删除选中</a>
            </div>
        </form>

        <form id="form" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">


        <table class="ui compact teal table">
            <thead>
            <tr>
                <th><input type="checkbox" id="firstCb"></th>
                <th>编号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
                <th>邮箱</th>
                <th>上次修改日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${pb.list}" var="user" varStatus="s">

            <tr>
                <td><input type="checkbox" name="uid" value="${user.id}"></td>
                <td>${s.count+(pb.currentPage-1)*8}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.sex}</td>
                <td>${user.email}</td>
                <td>${user.datetime}</td>
                <td>

                    <a class="ui mini teal basic button" href="${pageContext.request.contextPath}/findUserServlet?id=${user.id}">修改</a>
                    <a class="ui mini red basic button" href="javascript:deleteUser(${user.id});">删除</a>
                </td>
            </tr>
            </c:forEach>


            </tbody>
            <tfoot>
            <tr>
                <th colspan="8">
                    <div class="ui  mini pagination menu">
            <a class="icon item" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage - 1}&rows=8&username=${condition.username[0]}&sex=${condition.sex[0]}&email=${condition.email[0]}" aria-label="Previous">

            <i class="left chevron icon"></i>
            </a>

                        <c:forEach begin="1" end="${pb.totalPage}" var="i" >


                            <c:if test="${pb.currentPage == i}">
                              <a class="active item" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=8&username=${condition.username[0]}&sex=${condition.sex[0]}&email=${condition.email[0]}">${i}</a>
                            </c:if>
                            <c:if test="${pb.currentPage != i}">
                                <a class="item" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${i}&rows=8&username=${condition.username[0]}&sex=${condition.sex[0]}&email=${condition.email[0]}">${i}</a>
                            </c:if>

                        </c:forEach>
                        <a class="icon item" href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=8&username=${condition.username[0]}&sex=${condition.sex[0]}&email=${condition.email[0]}" aria-label="Next">

                        <i class="right chevron icon"></i>
                        </a>
                    </div>
                    <span style="font-size: 16px;margin-left: 10px;margin-bottom: 5px">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>

                </th>
            </tr>
            </tfoot>
        </table>
        </form>
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
            <img src="../img/ba.png" width="12px" height="12px"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002703" style="color:#8d8e8e ">豫公网安备 41019702002703号 </a><a href="http://beian.miit.gov.cn"  style="color:#8d8e8e "> 豫ICP备20006012号-1</a>
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