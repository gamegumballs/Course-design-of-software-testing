<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" language="javascript">
function showUser(){
	var user=document.getElementById("usernamee").value;
	if(user!=null&&user!="null"){
		var a=document.getElementById("denglu");
		var b=document.getElementById("zhuce");
		a.innerHTML="欢迎你，"+user+"！";
		b.innerHTML="";
	}
}
function toshopcarPage(){
	var user=document.getElementById("usernamee").value;
	if(user!=null&&user!="null"){
		window.location.href="shopcarPage.jsp";
	}
	else{
		alert("亲，这个登录了才可以用哦");
	}
}
function tocollect(){
	var user=document.getElementById("usernamee").value;
	if(user!=null&&user!="null"){
		window.location.href="collect.jsp";
	}
	else{
		alert("亲，这个登录了才可以用哦");
	}
}
function touser(){
	var user=document.getElementById("usernamee").value;
	if(user!=null&&user!="null"){
		window.location.href="user.jsp";
	}
	else{
		alert("亲，这个登录了才可以用哦");
	}
}
</script>
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<style type="text/css">
label{
font-size:20px;
}
.fenlei1{
border:1px solid black;
padding-top:25px;
padding-left:25px;
padding-bottom:60px;
}
.fenlei2{
border:1px solid black;
padding-left:25px;
padding-bottom:70px;
}
.fenlei3{
border:1px solid black;
padding-left:25px;
padding-bottom:25px;
}
</style>
</head>
<body onload="showUser()">
<%
String entername=(String)session.getAttribute("entername");
%>
<form>
  <input type="hidden" id="usernamee" value="<%=entername%>">
</form>
<div id="top">
	<div class="container"></div>
</div>
<div id="header">
	<div class="container">
		<ul class="left">
			<li><a href="enter.jsp"><span id="denglu">登录</span></a></li>
			<li><a href="login.jsp"><span id="zhuce">注册</span></a></li>
			<li class="shop_car"><span></span><a onclick="toshopcarPage()">购物车</a></li>
		</ul>
	</div>
	<div class="right" style="padding-top:5px">
	  <form action="search.jsp">
	    <input type="text" name="search" value="点击搜索更多" size="35">
	    <input type="submit" value="搜索">
	  </form>
	</div>
</div>
<div id="nav">
	<div class="container">
		<div class="logo left">
			<img src="img/logo.png">
		</div>
		<ul class="right">
			<li><a href="MainPage.jsp">首页</a></li>
			<li><a href="class_goods.jsp">商品分类</a></li>
			<li><a onclick="tocollect()">收藏夹</a></li>
			<li><a onclick="touser()">个人中心</a></li>
		</ul>
	</div>
</div>
  <div class="left" style="border:1px solid black;height:550px;width:100px;background:silver;">
    <div class="fenlei1"><a href="button.jsp" target="iframe1"><label>店铺</label></a></div>
    <div class="fenlei1"><a href="button2.jsp" target="iframe1"><label>热度</label></a></div>
    <div class="fenlei1"><a href="button3.jsp" target="iframe1"><label>穿着</label></a></div>
    <div class="fenlei1"><a href="button4.jsp" target="iframe1"><label>食品</label></a></div>
    <div class="fenlei1"><a href="button5.jsp" target="iframe1"><label>图书</label></a></div>
  </div>
    <iframe align="right" name="iframe1" width="93%" height="550" frameborder="0"></iframe>
</body>
</html>