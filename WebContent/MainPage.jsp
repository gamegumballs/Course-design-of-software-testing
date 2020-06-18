<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.awt.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>主页</title>
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
.desplay{
float:left;
width:300px;
height:400px;
margin:0px 20px 50px 20px;
}
label{
font-size:20px;
}
</style>
<style>
.slide {
    position: relative;
    margin: auto;
    width: 1500px;
    height: 280px;
    text-align: center;
    font-family: Arial;
    color: #FFF;
    overflow: hidden;
}

.slide ul {
    margin: 10px 0;
    padding: 0;
    width: 9999px;
    transition: all 0.5s;
}

/*//自动播放*/
.slide .slide-auto {
    animation: marginLeft 10.5s infinite;
}

.slide li {
    float: left;
    width: 1500px;
    height: 280px;
    list-style: none;
    line-height: 280px;
    font-size: 36px;
}
@keyframes marginLeft {
    0% {
        margin-left: 0px;
    }

    28.5% {
        margin-left: 0;
    }

    33.3% {
        margin-left: -1500px;
    }

    62% {
        margin-left: -1500px;
    }

    66.7% {
        margin-left: -3000px;
    }

    95.2% {
        margin-left: -3000px;
    }

    100% {
        margin-left: 0;
    }
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
	    <input type="text" name="search" size="35">
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
<div class="slide">
    <ul class="slide-auto">
    <li><img src="Resouce/1.jpg"></li>
    <li><img src="Resouce/2.jpg"/></li>
    <li><img src="Resouce/3.jpg"/></li>
    </ul>
</div>
<div style="background:red;height:30px">
  <div>
    <div style="padding-right:350px;padding-top:5px;" class="left"><a href="all_goods.jsp" target="iframe1"><label>全部</label></a></div>
    <div class="left" style="padding-top:5px;padding-right:350px;"><a href="new_goods.jsp" target="iframe1"><label>新品</label></a></div>
    <div class="left" style="padding-top:5px;padding-right:350px;"><a href="best_seller.jsp" target="iframe1"><label>热销品</label></a></div>
    <div class="left" style="padding-top:5px;padding-right:100px;"><a href="cheap_goods.jsp" target="iframe1"><label>优惠</label></a></div>
  </div>
</div>
<iframe name="iframe1" width="100%" height="1000" frameborder="0"></iframe>
</body>
</html>