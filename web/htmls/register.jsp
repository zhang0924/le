<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<title>register</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
		<script>



window.onload = function(){
	var img=document.getElementById("vcode");
	img.onclick=function () {
		var date=new Date().getTime();
		img.src="${pageContext.request.contextPath}/code?"+date;
	}
	//1.给表单绑定onsubmit事件
	document.getElementById("form").onsubmit = function(){
		//调用用户校验方法   chekUsername();
		//调用密码校验方法   chekPassword();
		//return checkUsername() && checkPassword();

		return checkUsername()&&checkEmail()&& checkPassword();
	}

	//给用户名和密码框分别绑定离焦事件
	document.getElementById("username").onblur = checkUsername;
	document.getElementById("password").onblur = checkPassword;
	document.getElementById("email").onblur = checkEmail;
	document.getElementById("password").onfocus = onfocusPassword;
}

//校验用户名
function checkUsername(){
	//1.获取用户名的值
	var username = document.getElementById("username").value;
	//2.定义正则表达式
	var reg_username = /^0?(13|14|15|16|18|17)[0-9]{9}$/;
	//3.判断值是否符合正则的规则
	var flag = reg_username.test(username);
	//4.提示信息
	var s_username = document.getElementById("s_username");

	if(flag){
		//提示绿色对勾
		s_username.innerHTML = "<img width='17' height='17' src='${pageContext.request.contextPath}/img/gou.png'/>";
	}else{
		//提示红色用户名有误
		s_username.innerHTML = "<img width='17 ' height='17' src='${pageContext.request.contextPath}/img/goux.png'/>手机号格式不正确";
	}
	return flag;
}

//校验密码
function checkPassword(){
	var light = document.getElementById("light");
	light.src = "${pageContext.request.contextPath}/img/logok.gif";
	//1.获取用户名的值
	var password = document.getElementById("password").value;
	//2.定义正则表达式
	var reg_password = /^\S{6,30}$/;
	//3.判断值是否符合正则的规则
	var flag = reg_password.test(password);
	//4.提示信息
	var s_password = document.getElementById("s_password");

	if(flag){
		//提示绿色对勾
		s_password.innerHTML = "<img width='17' height='17' src='${pageContext.request.contextPath}/img/gou.png'/>";
	}else{
		//提示红色用户名有误
		s_password.innerHTML = "<img width='17' height='17' src='${pageContext.request.contextPath}/img/goux.png'/>密码至少六个字符";
	}
	return flag;
}
//校验email
function checkEmail(){
	//1.获取用户名的值
	var email = document.getElementById("email").value;
	//2.定义正则表达式
	var reg_email = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
	//3.判断值是否符合正则的规则
	var flag = reg_email.test(email);
	//4.提示信息
	var s_email = document.getElementById("s_email");

	if(flag){
		//提示绿色对勾
		s_email.innerHTML = "<img width='17' height='17' src='${pageContext.request.contextPath}/img/gou.png'/>";
	}else{
		//提示红色用户名有误
		s_email.innerHTML = "<img width='17' height='17' src='${pageContext.request.contextPath}/img/goux.png'/>邮箱格式有误";
	}
	return flag;
}
	 function onfocusPassword(){
		 var light = document.getElementById("light");
		 light.src = "${pageContext.request.contextPath}/img/logob.gif";
	 }
	</script>
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand fadeInDown">
						<img src="${pageContext.request.contextPath}/img/logo1.png" id="light">
					</div>
					<div class="card fat fadeInLeft">
						<div class="card-body">
							<h4 class="card-title" style="font-family: 方正粗黑宋简体">注册</h4>
							<form id="form" action="${pageContext.request.contextPath}/registServlet" method="POST">
							 
								<div class="form-group">
									<label for="username" style="font-family: 方正粗黑宋简体">用户名: <span id="s_username" class="error"style="font-size: 10px;font-family: 方正粗黑宋简体;"></span></label>
									<input id="username" type="text" class="form-control" name="username" >
								</div>

								<div class="form-group">
									<label for="email" style="font-family: 方正粗黑宋简体">邮箱:<span id="s_email" class="error"style="font-size: 10px;font-family: 方正粗黑宋简体;"></span></label>
									<input id="email" type="text" class="form-control" name="email" value="" >
								</div>

								<div class="form-group">
									<label for="password" style="font-family: 方正粗黑宋简体">密码:<span id="s_password" class="error"style="font-size: 10px;font-family: 方正粗黑宋简体; "></span></label>
									<input id="password" type="password" class="form-control" name="password" value="" data-eye>
								</div>
								<div class="form-group">
									<label for="code" style="font-family: 方正粗黑宋简体">验证码:</label>

									<input id="code" type="code" class="form-control" name="code" value="" style="width: 190px;float: left;" required >
									<img id="vcode" src="${pageContext.request.contextPath}/code" style="width: 90px;height: 30px;float: left;margin-top: 5px;  margin-left:20px">
								</div>
								<div class="form-group">
									<label>
										<input type="checkbox" name="aggree" value="1"> I agree to the Terms and Conditions
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block" style="font-family: 方正粗黑宋简体">
										注册
									</button>
								</div>
								<div class="margin-top20 text-center" >
									已经有账号? <a href="${pageContext.request.contextPath}/htmls/login.jsp">立即登录</a>
								</div>
							</form>
						</div>
					</div>
					<!-- 出错显示的信息框 -->
					<c:if test="${regist_error!=null}">
						<div class="alert alert-warning alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" >
								<span>&times;</span>
							</button>
							<strong>${regist_error}</strong>
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