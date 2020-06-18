<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
.button_width{
width:100px
}
</style>
</head>
<body>
<form action="type1_Page.jsp"><input type="hidden" name="totype1" value="new_goods"><input class="button_width" type="submit" value="新品"></form>
<form action="type1_Page.jsp"><input type="hidden" name="totype1" value="cheap_goods"><input class="button_width" type="submit" value="优惠品"></form>
<form action="type1_Page.jsp"><input type="hidden" name="totype1" value="best_seller"><input class="button_width" type="submit" value="热销品"></form>
<form action="all_goods.jsp"><input type="hidden" name="totype1" value="best_seller"><input class="button_width" type="submit" value="所有"></form>
</body>
</html>