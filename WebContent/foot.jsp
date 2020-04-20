<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/js/jquery/2.0.0/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<style>
body{
    font-size: 12px;
    font-family: Arial;
}
a{
    color:#999;
}
.redColor{
    color: #C40000 !important;
}
nav.top{
    background-color: #f2f2f2;
    padding-top: 5px;
    padding-bottom: 5px;
    border-bottom:1px solid  #e7e7e7;
}
nav.top span, nav.top a{
    color: #999;
    margin: 0px 10px 0px 10px;
}
nav.top a:hover{
    color: #C40000;
    text-decoration: none;
}
h1.title
{
    color:blue;
    text-align:center;
}
img.loginBackgroundImg{
	display: block;
	margin-right:0px;
	margin-left :0px;
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

.footer {
  background-color: black;
  text-align: center;
  padding: 10px;
}
</style>
  
<nav class="top ">
        <a href="#nowhere">
            <span class="glyphicon glyphicon-home redColor"></span>
           健康首页
        </a> 
            
        <span>嗨，欢迎您的到来</span>
            <a href="#nowhere">请登录</a>
            <a href="#nowhere">免费注册</a> 
      
        <span class="pull-right">
            <a href="#nowhere">我的数据</a>
            <a href="#nowhere">
            <span class=" glyphicon glyphicon-shopping-cart redColor" ></span>
            数据表<strong>0</strong>张</a>       
        </span>
            
</nav>
<body>
<h1 class="title">血氧仪配套服务</h1>
<div id="loginDiv">
	<img src="/test/picture/background.png" class="loginBackgroundImg" id="loginBackgroundImg">
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
				<input type="password" placeholder="密码" name="password" id="password">			
			</div>
			<div>
				<a href="#nowhere" class="notImplementLink">忘记登录密码</a> 
				<a class="pull-right" href="#nowhere">免费注册</a> 
			</div>
			<div style="margin-top:20px">
				<button type="button" class="btn btn-block redButton">登录</button>
			</div>
		</div>	
</div>
<div class="footer">
       <div class="imformation">
           <h5>关于我们</h5>
           <a href="#nowhere" target="_blank">关于我们</a>
           <a href="#nowhere" target="_blank">联系方式</a>
           <a href="#nowhere" target="_blank">常见问题</a>
           <a href="#nowhere" target="_blank">更多信息</a>
       </div>
   
</div>
</body>
</html>