<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="array" scope="page" class="bean.AllBean"/>
<jsp:include flush="true" page="/admin/top.jsp"/>
<%
ArrayList userlogin = (ArrayList)session.getAttribute("userlogin");
if(userlogin == null || userlogin.size() == 0){
	%><script>alert('您还没有登录!');window.navigate('./index.jsp');</script><%
}else{
if(userlogin.get(3) != null && !userlogin.get(3).equals("管理员")){
	%><script>alert('您的身份不对，请重新登录!');window.navigate('./index.jsp');</script><%
}else{
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>  
  <body>
    <table width="1870" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="border_left border_right border_bottom" height="400" valign="top" align="center">        
<table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="5"></td>
          </tr>
        </table>
		<form name="form1" method="post" action="">
		  <table width="1870" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25" colspan="12" align="center" class="tabletd1">挂号信息管理</td>
          </tr>
          <tr class="tabletd2">
            <td height="25" align="center">序号</td>
            <td height="25" align="center">病历号</td>
            <td height="25" align="center">病人姓名</td>
            <td align="center">性别</td>
            <td align="center">年龄</td>
            <td align="center">家庭住址</td>
            <td align="center">所挂科室</td>
            <td align="center">挂号类型</td>
            <td align="center">价格</td>
            <td align="center">挂号员</td>
            <td align="center">时间</td>
            <td height="25" align="center">&nbsp;</td>
          </tr>
          <%
          ArrayList invalid = array.getInvalidAdmin();
          for(int i = 0;i < invalid.size();i++){
          	ArrayList alRow = (ArrayList)invalid.get(i);
           %>
          <tr class="tabletd<%=i%2+1 %>">
            <td height="25" align="center"><%=i+1 %></td>
            <td height="25" align="center"><a href="admin/register_show.jsp?id=<%=alRow.get(0) %>"><%=alRow.get(1) %></a></td>
            <td height="25" align="center"><%=alRow.get(2) %></td>
            <td align="center"><%=alRow.get(3) %></td>
            <td align="center"><%=alRow.get(4) %></td>
            <td align="center"><%=alRow.get(5) %></td>
            <td align="center"><%=alRow.get(6) %></td>
            <td align="center"><%=alRow.get(7) %></td>
            <td align="center"><%=alRow.get(8) %></td>
            <td align="center"><%=alRow.get(9) %></td>
            <td align="center"><%=alRow.get(10).toString().substring(0,16) %></td>
            <td height="25" align="center"><a href="DelServlet?invalid=<%=alRow.get(0) %>">删除</a></td>
          </tr>
          <%} %>
        </table>
                </form>
        </td>
  </tr>
</table>
  </body>
  <jsp:include flush="true" page="/admin/bottom.jsp"/>
</html>
<%}} %>
