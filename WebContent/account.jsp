<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
	String user_id=(String)session.getAttribute("user_id");
	String new_enter_name=request.getParameter("new_enter_name");
	String sql1="update user_table set user_name='"+request.getParameter("new_enter_name")+"' where user_id='"+user_id+"';";
	stmt.execute(sql1);
	String sql2="update user_table set password='"+request.getParameter("new_password")+"' where user_id='"+user_id+"';";
	stmt.execute(sql2);
	session.setAttribute("entername",new_enter_name);
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
<%="你的信息已成功修改！,刷新页面可以看到你的新名字" %>
</body>
</html>