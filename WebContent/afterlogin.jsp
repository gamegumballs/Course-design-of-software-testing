<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册处理</title>
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
	int id_sum=0;
	stmt=con.createStatement();
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String payword=request.getParameter("payword");
	//将用户的信息插入到数据库中的用户表当中
	String sql1="select * from user_table;";
	res=stmt.executeQuery(sql1);
	res.last();
	id_sum=res.getRow();
	String id_sum_string=id_sum+"";
	String sql2="insert into user_table values('"+username+"','"+"null','"+password+"','"+payword+"','"+"shopcar"+id_sum_string+"','"+"null','"+"1000','"+"user"+id_sum_string+"','"+"goods_collect"+id_sum_string+"','"+"shops_collect"+id_sum_string+"');";
	stmt.execute(sql2);
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
<%="注册成功"%><br>
<a href="enter.jsp">前去登录</a>
</body>
</html>