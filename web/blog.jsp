<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>博客详情</title>
<!--    <link rel="stylesheet" href="./css/semantic.min.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/typo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/libs/prism/prism.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/libs/tocbot/tocbot.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">
</head>
<body>
<!--导航-->
<nav class="ui inverted vertical segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item animated rubberBand">Blog</h2>
            <a href="${pageContext.request.contextPath}/findBlogByPageServlet" class="m-item item   m-mobile-hide"><i class="home icon"></i>首页</a>
            <a href="${pageContext.request.contextPath}/findTypeByPageServlet" class=" m-item item m-mobile-hide" ><i class="idea icon"></i>分类</a>
            <a href="${pageContext.request.contextPath}/findTagByPageServlet" class="m-item item m-mobile-hide" ><i class="tags icon"></i>标签</a>
            <a href="${pageContext.request.contextPath}/findYearByPageServlet" class="m-item item m-mobile-hide" ><i class="clone icon"></i>归档</a>
            <a href="${pageContext.request.contextPath}/about.jsp" class=" m-item item m-mobile-hide" ><i class="info icon"></i>关于我</a>
            <div class="right m-item item m-mobile-hide">
                <div class="ui icon inverted transparent input">
                    <input type="text" placeholder="Search..." >
                    <i class="search link icon"></i>
                </div>
            </div>
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
<div id="waypoint" class="m-container-small m-padded-tb-big animated fadeInDownBig">
    <div class="ui container">
        <div class="ui top attached segment">
      <!--      头部-->
            <div class="ui horizontal link list">
                <div class="item">
                    <img src="${requestScope.blog.icon}" class="ui avatar image">
                    <div class="content"><a href="#" class="header">${requestScope.blog.niname}</a> </div>
                </div>
                <div class="item">
                    <i class="calendar icon"></i>${requestScope.blog.datetime}
                </div>
                <div class="item">
                    <i class="eye icon"></i>${requestScope.blog.eye}
                </div>
            </div>
            </div>

        <div class="ui attached segment">
            <img src="${requestScope.blog.indexPicture}" class="ui fluid rounded image">
        </div>
        <div class="ui attached padded segment">
            <div class="ui right aligned basic segment">
                <div class="ui orange basic label">${requestScope.blog.yzf}</div>
            </div>
            <h2 class="ui center aligned header"><!--青春是场远行-->${requestScope.blog.title}</h2>
            <br>
            <div id="content" class="typo typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">${requestScope.s1}

            </div>
            <!--标签-->
            <div class="m-padded-lr-responsive">
                <c:if test="${requestScope.blog.tag.length()>0}">
                 <c:forEach begin="0" end="${requestScope.blog.tag.length()-1}" var="i" step="2">

                    <c:if test="${requestScope.blog.tag.charAt(i)==49}"><div class="ui basic teal left pointing label">Java</div></c:if>
                    <c:if test="${requestScope.blog.tag.charAt(i)==50}"><div class="ui basic teal left pointing label">JavaSE</div></c:if>
                    <c:if test="${requestScope.blog.tag.charAt(i)==51}"><div class="ui basic teal left pointing label">JavaEE</div></c:if>
                    <c:if test="${requestScope.blog.tag.charAt(i)==52}"><div class="ui basic teal left pointing label">MySQL</div></c:if>
                    <c:if test="${requestScope.blog.tag.charAt(i)==53}"><div class="ui basic teal left pointing label">前端</div></c:if>


                    </c:forEach>
                </c:if>
            </div>
            <!--赞赏-->
            <div class="ui center aligned basic segment">
               <c:if test="${requestScope.flag!=1}">
                   <c:if test="${sessionScope.userLogin.id==null}">
                 <a href="${pageContext.request.contextPath}/htmls/login.jsp" class="ui orange basic circular button">
                     <i class="orange star icon"></i>收藏
                </a>
                   </c:if>
                   <c:if test="${sessionScope.userLogin.id!=null}">
                       <a href="${pageContext.request.contextPath}/addscangservlet?id=${requestScope.id}&uid=${sessionScope.userLogin.id}" class="ui orange basic circular button">
                           <i class="orange star icon"></i>收藏
                       </a>
                   </c:if>
               </c:if>
                <c:if test="${requestScope.flag==1}">
                    <a  class="ui orange basic circular button">
                        <i class="orange star icon"></i>已收藏
                    </a>
                </c:if>
            </div>
      <%--      <div class="ui payQR flowing popup  transition hidden">
                <div class="ui orange basic label">
                    <div class="ui images" style="font-size: inherit !important;">
                        <div class="image">
                            <img src="img/erweima.png" class="ui rounded bordered image" style="width: 120px">
                            <div>支付宝</div>
                        </div>
                        <div class="image">
                            <img src="img/erweima.png" class="ui rounded bordered image" style="width: 120px">
                            <div>微信</div>
                        </div>
                    </div>
                </div>
            </div>--%>


        </div>
        <div class="ui attached positive message">
        <!--    博客信息-->
            <div class="ui grid">
                <div class="eleven wide column">
                    <ui class="list">
                        <li>作者：${requestScope.blog.niname}（练习作者）</li>
                        <li>发表时间：${requestScope.blog.datetime}</li>
                        <li>版权声明：自由转载-非商用-非衍生-保持署名</li>

                    </ui>
                </div>
                <div class="five wide column">
                    <img src="img/erweima.png" class="ui right floated rounded bordered image" style="width: 110px !important;">

                </div>
            </div>


        </div>
        <div id="comment-container" class="ui bottom attached segment">
          <!-- 留言区-->
            <div class="ui teal segment">

                <div class="ui comments">
                    <h3 class="ui dividing header">${requestScope.comments.size()}&ensp;评论</h3>
                    <c:forEach items="${requestScope.comments}" var="comments" varStatus="s">
                    <div class="comment">
                        <a class="avatar">
                            <img src="${comments.icon}">
                        </a>
                        <div class="content">
                            <a class="author">
                                    <c:if test="${comments.niname==null}">
                                        ${comments.username}
                                    </c:if>
                                <c:if test="${comments.niname!=null}">
                                    ${comments.niname}
                                </c:if>
                            </a>
                            <div class="metadata">
                                <span class="date">${comments.datetime}</span>
                            </div>
                            <div class="text">
                                ${comments.comment}
                            </div>
                            <div class="actions">
                                <a class="reply">回复</a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                        </div>
                    </div>
        </div>
            <div class="ui form">
                <c:if test="${sessionScope.userLogin!=null}">
                <form action="${pageContext.request.contextPath}/addCommentServlet" method="post">
                    </c:if>
                        <c:if test="${sessionScope.userLogin==null}">
                        <form action="${pageContext.request.contextPath}/achas" method="post">
                        </c:if>
                    <input type="hidden" name="uid" value="${sessionScope.userLogin.id}">
                    <input type="hidden" name="bid" value="${requestScope.id}">
                <div class="field">
                    <textarea name="comment" placeholder="请输入评论信息..."></textarea>
                </div>
                <div class="field">
                    <c:if test="${sessionScope.userLogin==null}">
                        <div class="field">
                        <button class="ui teal button" ><img src="img/pen.png" style="width: 20px !important;"> 发布</button>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.userLogin!=null}">
                    <div class="field">
                        <%--<input type="submit" class="ui teal button" value="发布" >--%>
                        <button class="ui teal button" ><img src="img/pen.png" style="width: 20px !important;"> 发布</button>
                    </div>
                    </c:if>
                </div>

                </form>

            </div>
        </div>
    </div>
</div>
<div id="toolbar" class="m-padded m-fixed m-right-bottom" style="display: none">
    <div class="ui vertical icon buttons ">
        <button type="button" class="ui toc teal button">目录</button>
        <a href="#comment-container"  class="ui teal button">留言</a>
        <button class="ui wechat icon button"><i class="weixin icon"></i> </button>
        <div id="toTop-button" class="ui icon button"><i class="chevron up icon"></i> </div>
    </div>
</div>
<div class="ui toc-container flowing popup  transition hidden" style="width: 250px!important;">
   <ol class="js-toc">

   </ol>
    </div>

<div id="qrcode" class="ui wechat-qr flowing popup transition hidden "style="width: 130px !important;">
    <!--<img src="./img/erweima.png" alt="" class="ui rounded image" style="width: 120px !important;">-->
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
            <img src="../img/ba.png" width="12px" height="12px"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002703" style="color:#8d8e8e ">豫公网安备 41019702002703号 </a><a href="http://beian.miit.gov.cn"  style="color:#8d8e8e "> 豫ICP备20006012号-1</a>
            <br/>Copyright &copy; 2020 zhanglele.club. All rights reserved.
        </p >
    </div>
</footer>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/semantic.min.js"></script>
<script src="${pageContext.request.contextPath}/libs/prism/prism.js"></script>
<script src="${pageContext.request.contextPath}/libs/tocbot/tocbot.js"></script>
<script src="${pageContext.request.contextPath}/libs/qrcode/qrcode.min.js"></script>
<script src="${pageContext.request.contextPath}/libs/waypoints/jquery.waypoints.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>
<script>
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
/*    $('#payButton').popup({
        popup : $('.payQR.popup'),
        on : 'click',
        position:'bottom center'
    });*/
    $('.toc.button').popup({
        popup : $('.toc-container.popup'),
        on : 'click',
        position:'left center'
    });
    tocbot.init({
        // Where to render the table of contents.
        tocSelector: '.js-toc',
        // Where to grab the headings to build the table of contents.
        contentSelector: '.js-toc-content',
        // Which headings to grab inside of the contentSelector element.
        headingSelector: 'h1, h2, h3',
    });

    $('.wechat').popup({
        popup : $('.wechat-qr'),
        on : 'click',
        position: 'left center'
    });
    var serurl = /*[]*/"zhanglele.club";
    var url = "${pageContext.request.contextPath}/acha?id=${blog.id}";
    var qrcode = new QRCode("qrcode", {
        text: serurl+url,
        width: 110,
        height: 110,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
    $('#toTop-button').click(function () {
        $(window).scrollTo(0,500);
    });
    var waypoint = new Waypoint({
        element: document.getElementById('waypoint'),
        handler: function(direction) {
            if (direction == 'down') {
                $('#toolbar').show(100);
            } else {
                $('#toolbar').hide(500);
            }
            console.log('Scrolled to waypoint!  ' + direction);
        }
    })

    $('.ui.dropdown').dropdown({
        on : 'hover'
    });
</script>
</body>
</html>