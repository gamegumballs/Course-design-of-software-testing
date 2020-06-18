<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title</title>
</head>
<body>
<div style="float:left">
<form>
  <table width="80%" align="center">
    <tr>
      <th></th>
      <th align="left">商品名称</th>
      <th align="left">商品描述</th>
      <th align="left">价格</th>
      <th align="right">所属店铺</th>
    </tr>
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
	String sql1="select * from user_goods_table,goods_table where user_goods_table.goods_id=goods_table.goods_id and user_id='"+user_id+"';";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		String image_path="Resouce/"+res.getString("goods_image");
%>
  <tr>
    <td width="20%">
      <div style="float:left">
        <div style="float:left">
            <form>
            <input type="hidden" name="shop_name" value="<%=res.getString("shop_id")%>">
            <input type="submit" value="图片">店铺：<%=res.getString("shop_name")%>
            </form>
        </div>
      </div>
    <img src="<%=image_path%>" width="160px" height="160px">
    </td>
    <td><%=res.getString("goods_name")%></td>
    <td><%=res.getString("goods_information")%></td>
    <td><%=res.getString("goods_value")%></td>
    <td align="right"><%=res.getString("shop_name")%></td>
  </tr>
<%
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
%>
  </table>
 </form>
</div>
</body>
</html>