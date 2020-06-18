<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>将商品从购物车里删除</title>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	int result=0;
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String shopcar_id=(String)session.getAttribute("shopcar_id");
	String sql1="delete from shopcar_table where goods_id='"+request.getParameter("delete")+"' and shopcar_id='"+shopcar_id+"';";
	stmt.execute(sql1);
	String sql2="select * from goods_table where goods_id='"+request.getParameter("delete")+"';";
	res=stmt.executeQuery(sql2);
	while(res.next()){
		out.print("物品");
		out.print(res.getString("goods_name"));
		out.print("已从你的购物车移除");
	}
%>
<br><a href="shopcarPage.jsp">返回购物车</a>
<%
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