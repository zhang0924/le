<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>login</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
	<script>
		window.onload = function(){
			var img=document.getElementById("vcode");
			img.onclick=function () {
				var date=new Date().getTime();
				img.src="${pageContext.request.contextPath}/code?"+date;
			}
			//给密码框绑定离焦 聚焦事件
			document.getElementById("password").onblur = onblurPassword;
			document.getElementById("password").onfocus = onfocusPassword;
		}
		function onblurPassword(){
			var light = document.getElementById("light")
			light.src = "${pageContext.request.contextPath}/img/logok.gif"
		}
		function onfocusPassword(){
			var light = document.getElementById("light")
			light.src = "${pageContext.request.contextPath}/img/logob.gif"
		}
	</script>
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand animated fadeInDown">
						<img src="${pageContext.request.contextPath}/img/logo1.png" id="light">
					</div>
					<div class="card fat animated fadeInLeft">
						<div class="card-body">
							<h4 class="card-title" style="font-family: 方正粗黑宋简体">登录</h4>
							<form action="${pageContext.request.contextPath}/LoginServlet" method="POST">
							 
								<div class="username">
									<label for="username" style="font-family: 方正粗黑宋简体">用户名:</label>

									<input id="username" type="text" class="form-control" name="username" value="" required >
								</div>

								<div class="form-group">
									<label for="password" style="font-family: 方正粗黑宋简体">密码:
										<a href="forgot.html" class="float-right">
											忘记密码?
										</a>
									</label>
									<input id="password" type="password" class="form-control" name="password" required data-eye>
								</div>
								<div class="form-group">
									<label for="code" style="font-family: 方正粗黑宋简体">验证码:</label>

									<input id="code" type="code" class="form-control" name="code" value="" required  style="float: left;width: 200px">
									  <img id="vcode" src="${pageContext.request.contextPath}/code" style="width: 90px;height: 30px;float: left;margin-top: 5px;  margin-left:20px">
								</div>


								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> 记住密码
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block" style="font-family: 方正粗黑宋简体">
										登录
									</button>
								</div>
								<div class="margin-top20 text-center">
									还没有账号? <a href="${pageContext.request.contextPath}/htmls/register.jsp">立即注册</a>
								</div>
							</form>
						</div>
					</div>
					<!-- 出错显示的信息框 -->
					<c:if test="${login_msg!=null}">
						<div class="alert alert-warning alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" >
								<span>&times;</span>
							</button>
							<strong>${login_msg}</strong>
						</div>
					</c:if>
					<div class="footer">
    <img src="${pageContext.request.contextPath}/img/ba.png" width="15px" height="15px"><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002703" >豫公网安备 41019702002703号</a>  <a href="http://beian.miit.gov.cn" >豫ICP备20006012号-1</a>
    <br/>Copyright &copy; 2020 zhanglele.club. All rights reserved.
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/my-login.js"></script>
</body>
</html>