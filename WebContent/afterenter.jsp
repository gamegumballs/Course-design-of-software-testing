<%@ page language="java" import="java.sql.*" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录处理</title>
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
	String entername=request.getParameter("login_name");
	String enterpassword=request.getParameter("login_password");
	session.setAttribute("entername",entername);
	session.setAttribute("enterpassword",enterpassword);
	String sql1="select * from user_table;";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		if(entername.equals(res.getString("user_name"))&&enterpassword.equals(res.getString("password"))){
			session.setAttribute("shopcar_id",res.getString("shopcar_id"));
			session.setAttribute("payword",res.getString("payword"));
			session.setAttribute("wallet",res.getDouble("wallet"));
			session.setAttribute("user_id",res.getString("user_id"));
			session.setAttribute("user_goods_collect_id",res.getString("goods_collect_id"));
			session.setAttribute("shops_collect_id",res.getString("shops_collect_id"));//获取用户的各种信息，其他页面可共享
			result=1;
		}
	}
	if(result==0){
	out.println("用户名或密码有错误！");
%>
<a href="enter.jsp">点击返回登录页面</a>	
<%
	}
	else{
%>
<jsp:forward page="MainPage.jsp"/>
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
<jsp:useBean id="user" scope="session" class="MyBean.User"/>
<jsp:setProperty name="user" property="*"></jsp:setProperty>
<h3><%=user.getLogin_name()%></h3>
<h3><%=user.getLogin_Password()%></h3>
</body>
</html>