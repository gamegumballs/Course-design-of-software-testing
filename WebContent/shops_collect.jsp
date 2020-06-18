<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
.desplay{
float:left;
width:200px;
height:300px;
margin:0px 20px 50px 20px;
}
</style>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String shops_collect_id=(String)session.getAttribute("shops_collect_id");
	String sql1="select * from shops_collect_table,shop_table where shops_collect_table.shop_id=shop_table.shop_id and shops_collect_id='"+shops_collect_id+"';";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		String image_path="Resouce/"+res.getString("shop_image");
		//session.setAttribute(res.getString("goods_id"),res.getString("goods_id"));
%>
<div class="desplay">
<img src="<%=image_path%>" width="200px" height="200px">
<%=res.getString("shop_name")%>
<%="："%><br>
<%=res.getString("shop_information")%><br>
<form action="shopPage.jsp">
<input type="hidden" name="toshop" value="<%=res.getString("shop_table.shop_name")%>">
<input type="submit" value="进店看看">
</form>
</div>
<%
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}catch(SQLException ex){
	ex.printStackTrace();
	out.print("用户名或密码错误");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
%>
</body>
</html>