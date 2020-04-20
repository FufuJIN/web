<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/show/js/jquery/2.0.0/jquery.min.js"></script>
<link href="/show/js/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="/show/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<style>
img.loginBackgroundImg{
	display: block;
	margin: 0px auto;
}
div.loginSmallDiv{
	background-color: white;
	position: absolute;
	right: 80px;
	top: 180px;
	width: 350px;
	height: 400px;
	padding: 60px 25px 80px 25px;
}
div.login_acount_text{
	color: #3C3C3C;
	font-size: 16px;
	font-weight: bold;
}
div.loginInput{
	border: 1px solid #CBCBCB;
	margin: 20px 0px;
}
div.loginInput span.loginInputIcon{
	margin: 0px;
	background-color: #CBCBCB;
	width: 40px;
	height: 40px;
	display:inline-block;
}
span.loginInputIcon span.glyphicon{
	font-size: 22px;
	position: relative;
	left: 9px;
	top: 9px;
	color: #606060;
}
div.loginInput input{
	display: inline-block;
	border: 0px solid transparent;
	width: 244px;
	height: 30px;
	position: relative;
	left: 6px;
	top: 6px;
}
body{
	font-size: 12px;
	font-family: Arial;
}
a{
	color:#999;
}
a:hover{
	text-decoration:none;
	color: #C40000;
}
button.redButton{
	color: white;
	background-color: #C40000;
	font-size: 14px;
	font-weight: bold;
}
</style>



<div id="loginDiv">
	<img src="/show/picture/background.png" class="loginBackgroundImg" id="loginBackgroundImg">
	<form action="/show/servletLogin" method="post">
		<div class="loginSmallDiv" id="loginSmallDiv">
			<div class="login_acount_text">账户登录</div>
			<div class="loginInput ">
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-user"></span>
				</span>
				<input type="text" placeholder="手机/会员名/邮箱" name="name" id="name">			
			</div>
			<div class="loginInput ">
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
				<input type="password" placeholder="密码" name="pwd" id="pwd">		
			</div>
			<div>
				<a href="#nowhere" class="notImplementLink">忘记登录密码</a> 
				<a class="pull-right" href="#nowhere">免费注册</a> 
			</div>
			<div style="margin-top:20px">
				<button type="submit" value="提交" id = "submitbtn" class="btn btn-block redButton">登录</button>
			</div>
		</div>	
		</form>
</div>
