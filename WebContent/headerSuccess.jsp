<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery/2.0.0/jquery.js"></script>
<link href="js/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
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
</style>
  
<nav class="top ">
        <a href="#nowhere">
            <span class="glyphicon glyphicon-home redColor"></span>
           健康首页
        </a> 
            
        <span>嗨，欢迎您的到来</span>
            <a href="#nowhere" name="loginMsg" id="loginMsg">登陆成功</a>
            <a href="#nowhere" name="msg" id="msg"><%=session.getAttribute("uname") %>,欢迎你的到来！</a> 
      
        <span class="pull-right">
            <a href="#nowhere">我的数据</a>
            <a href="#nowhere">
            <span class=" glyphicon glyphicon-shopping-cart redColor" ></span>
            数据表<strong>0</strong>张</a>       
        </span>
            
</nav>
<body>
<h1 class="title">血氧仪配套服务</h1>   
</body>