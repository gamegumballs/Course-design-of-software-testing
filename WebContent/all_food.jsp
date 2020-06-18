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
width:300px;
height:400px;
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
	String sql1="select * from goods_table where shop_id in('ykj','czw','pwsj','xdl')";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		String image_path="Resouce/"+res.getString("goods_image");
		//session.setAttribute(res.getString("goods_id"),res.getString("goods_id"));
%>
<div class="desplay">
<form action="goods_desplay.jsp" method="post">
<input type="hidden" name="goods_information" value="<%=res.getString("goods_id")%>">
<input style="background: url(<%=image_path%>);width:300px;height:300px;border:solid #dedede 1px;" type="submit" value=""><br>
</form>
<%=res.getString("goods_name")%>
<%="："%><br>
<%=res.getString("goods_information")%><br>
<%="售价：" %>
<%=res.getString("goods_value")%>
<%="元"%>
<form action="addto_shopcar.jsp" method="post">
<input type="hidden" name="goods_id" value="<%=res.getString("goods_id")%>">
<input type="submit" value="添加到购物车">
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