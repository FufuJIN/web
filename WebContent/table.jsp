<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="/js/bootstrap/3.3.6/bootstrap.min.js"></script>       
</head>
<table class="table">
<form action="/test/ServletSearchAll" method="post"> 
  <tr>
     <td>用户名</td>
     <td>密码</td>  
     <td>操作</td>
     <td><input type="submit" value="更新"/></td>
  </tr>
  </form> 
  <c:forEach var="U" items="${userAll}"> 
  <form action="/test/ServletSearchAll" method="post"> 
     <tr>
        <td><input type="text" value="${U.userName}" name="name"></td>
        <td><input type="text" value="${U.passWord}" name="pwd"></td> 
        <td><input type="submit" value="更新"/></td>
       </tr>
     </form>
   </c:forEach>  
</table>