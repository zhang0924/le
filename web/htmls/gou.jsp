<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/iconp.png" type="image/x-icon">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/gou.css">
</head>
<body>

<svg width="400" height="400">
    <circle fill="none" stroke="#68E534" stroke-width="20" cx="200" cy="200" r="190" class="circle" stroke-linecap="round" transform="rotate(-90 200 200) "/>
    <polyline fill="none" stroke="#68E534" stroke-width="24" points="88,214 173,284 304,138" stroke-linecap="round" stroke-linejoin="round" class="tick" />
</svg>

<h2>${requestScope.success} ${requestScope.username}</h2>
</body>
<script>
    var second = 4;
    //定义一个方法，获取span标签，修改span标签体内容，时间--
    function showTime(){
        second -- ;
        //判断时间如果<= 0 ，则跳转到首页
        if(second <= 0){
            //跳转到首页
            location.href = "${pageContext.request.contextPath}/htmls/login.jsp";
        }
    }


    //设置定时器，1秒执行一次该方法
    setInterval(showTime,1000);

</script>
</html>