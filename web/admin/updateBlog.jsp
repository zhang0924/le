<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>博客修改</title>
<!--    <link rel="stylesheet" href="../css/semantic.min.css">-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/libs/editormd/css/editormd.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/me.css">
   <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery1.4.3/jquery.min.js"></script>
    <script>!window.jQuery && document.write("<script src=\"scripts/jquery-1.4.3.min.js\">" + "<\/scrript>")-->
  <!--  <script>!window.jQuery && document.write("<link rel='stylesheet' href='../css/semantic.min..css'>")
            </script>-->
</head>
<body>
<!--导航-->
<nav class="ui inverted vertical segment m-padded-tb-mini m-shadow-small">
    <div class="ui container">
        <div class="ui inverted secondary stackable menu">
            <h2 class="ui teal header item">管理后台</h2>
            <a href="${pageContext.request.contextPath}/findBlogsByPageServlet" class=" active m-item item   m-mobile-hide"><i class="home icon"></i> 博客</a>

            <a href="${pageContext.request.contextPath}/findUserByPageServlet" class="m-item item m-mobile-hide" ><i class="address book icon"></i>管理用户</a>

            <div class="right m-item m-mobile-hide menu">
                <div class="ui dropdown item">
                    <div class="text">
                        <img src="${sessionScope.useroot.icon}" class="ui avatar image">
                        ${sessionScope.useroot.niname}
                    </div>
                    <!--<img src="../img/xl.png" style="width: 20px !important;">-->
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
            <a  class="teal active item">修改博客</a>

        </div>

    </div>
</div>
<!--中间内容-->
<div class="m-container m-padded-tb-big">
    <div class="ui container">
        <form action="${pageContext.request.contextPath}/xiugaiBlogServlet" method="post" class="ui form">
            <input type="hidden" name="icon" value="${sessionScope.useroot.icon}">
            <input type="hidden" name="niname" value="${sessionScope.useroot.niname}">
            <input type="hidden" value="${requestScope.blog.id}" name="id">
            <div class="required field">
                <div class="ui left labeled input">
                    <div class="ui selection  compact teal basic dropdown label">
                        <input type="hidden" value="${requestScope.blog.yzf}" name="yzf">
                        <i class="dropdown icon"></i>
                        <div class=" text">${requestScope.blog.yzf}</div>
                        <div class="menu">
                            <div class="item" data-value="原创">原创</div>
                            <div class="item" data-value="转载">转载</div>
                            <div class="item" data-value="翻译">翻译</div>
                        </div>
                    </div>
                    <input type="text" name="title" placeholder="标题" value="${requestScope.blog.title}">
                </div>
            </div>

            <div class="field">
                <div id="md-content" style="z-index: 1!important;">
                    <!--<textarea placeholder="博客内容" name="content" style="display: none" th:text="*{content}"></textarea>-->
                <textarea placeholder="博客内容" name="content" style="display: none;">${requestScope.blog.content}</textarea>

                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <div class="ui left labeled action input">
                        <label class="ui compact teal basic label">分类</label>
                        <div class="ui fluid selection dropdown">
                            <input type="hidden" name="type" value="${requestScope.blog.type}">
                  <!--          <img src="../img/xl.png" style="width: 12px !important;float: right!important;" >-->
                            <i class="dropdown icon"></i>
                            <div class="default text">分类</div>
                            <div class="menu">
                                <div class="item" data-value="1">笔记</div>
                                <div class="item" data-value="2">数据结构与算法</div>
                                <div class="item" data-value="3">知识分享</div>
                                <div class="item" data-value="4">思考与感悟</div>
                                <div class="item" data-value="5">其他</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="field">
                        <div class="ui left labeled action input">
                            <label class="ui compact teal basic label">标签</label>
                            <div class="ui fluid selection multiple search  dropdown">
                                <input type="hidden" name="tag" value="${requestScope.blog.tag}">
                                <!--<img src="../img/xl.png" style="width: 12px !important;float: right!important;" >-->
                                <i class="dropdown icon"></i>
                                <div class="default text">标签</div>
                                <div class="menu">
                                    <div class="item" data-value="1">Java</div>
                                    <div class="item" data-value="2">JavaSE</div>
                                    <div class="item" data-value="3">JavaEE</div>
                                    <div class="item" data-value="4">MySQL</div>
                                    <div class="item" data-value="5">前端</div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="field">
                <div class="ui left labeled input">
                    <label class="ui teal basic label">首图</label>
                    <input type="text" name="indexPicture" placeholder="首图引用地址" value="${requestScope.blog.indexPicture}">
                </div>
            </div>
            <div class="field">
                <!--<textarea placeholder="博客内容" name="content" style="display: none" th:text="*{content}"></textarea>-->
                <textarea placeholder="摘要" name="zy" >${requestScope.blog.zy}</textarea>
            </div>
<div class="inline fields">
    <div class="field">
        <div class="ui checkbox">
        <input type="checkbox" id="recommend" name="recommend" class="hidden" checked>
        <label for="recommend">推荐</label>
         </div>
    </div>
    <div class="field">
        <div class="ui checkbox">
            <input type="checkbox" id="shareInfo" name="shareInfo" class="hidden">
            <label for="shareInfo">转载声明</label>
        </div>
    </div>
    <div class="field">
        <div class="ui checkbox">
            <input type="checkbox" id="appreciation" name="appreciation" class="hidden">
            <label for="appreciation">赞赏</label>
        </div>
    </div>
    <div class="field">
        <div class="ui checkbox">
            <input type="checkbox" id="comment" name="comment" class="hidden">
            <label for="comment">评论</label>
        </div>
    </div>
</div>

            <div class="ui error message"></div>
            <div class="ui right aligned container">
                <button type="button" class="ui button" onclick="window.history.go(-1)">返回</button>
                <button class="ui secondary button">保存</button>
                <%--<button class="ui teal button">发布</button>--%>
                <input class="ui right floated teal button" type="submit" value="发布" />

            </div>
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
<script src="${pageContext.request.contextPath}/libs/editormd/editormd.min.js"></script>
<!--<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>-->

<script>
/*    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });
    $('.ui.dropdown').dropdown({
        on:'hover'
    });
    $('.ui.form').form({
        fields:{
            tittle:{
                identifier:'title',
                rules:[{
                    type:'empty',
                    prompt:'标题：请输入博客标题'
                }]
            }
        }
    });*/

    //初始化Markdown编辑器
    var contentEditor;
    $(function() {
        contentEditor = editormd("md-content", {
            width   : "100%",
            height  : 640,
            syncScrolling : "single",
            path    : "${pageContext.request.contextPath}/libs/editormd/lib/"
        });
    });
    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
        on : 'hover'
    });

    $('#save-btn').click(function () {
        $('[name="published"]').val(false);
        $('#blog-form').submit();
    });


    $('#publish-btn').click(function () {
        $('[name="published"]').val(true);
        $('#blog-form').submit();
    });



    $('.ui.form').form({
        fields : {
            title : {
                identifier: 'title',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客标题'
                }]
            },
            yzf : {
                identifier: 'yzf',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客原创/翻译/转载'
                }]
            },
            content : {
                identifier: 'content',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客内容'
                }]
            },
            typeId : {
                identifier: 'type',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客分类'
                }]
            },
            tag : {
                identifier: 'tag',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客标签'
                }]
            },
            indexPicture : {
                identifier: 'indexPicture',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客首图'
                }]
            },
            zy : {
                identifier: 'zy',
                rules: [{
                    type : 'empty',
                    prompt: '标题：请输入博客描述'
                }]
            }
        }
    });

</script>
</body>
</html>