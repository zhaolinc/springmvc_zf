<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<HTML>
<HEAD>
<base href="${pageContext.request.contextPath}/"/>

<TITLE>搜房网租房</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="style/mycss.css" rel="stylesheet" type="text/css" />
<link href="style/texts.css" rel="stylesheet" type="text/css" />
<link href="style/btn.css" rel="stylesheet" type="text/css" />
<style>
	.page-nav a{color: #5285c5;}
</style>

</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5"><img src="images/top.jpg" width="780" height="213"></td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/middle1.jpg" width="780" height="47"></td>
  </tr>
  <tr>
    <td width="38" background="images/middle2.jpg">&nbsp;</td>
    <td width="172" valign="top">

<script language="javascript">
<!--
	function login(){
		if( document.myForm.uname.value =="" ){
			alert("用户名不能为空");
			return false;
		}else if(document.myForm.upass.value == ""){
			alert("密码不能为空");
			return false;
		} else {
			return true;
		}
	}
-->
</script>

	<table align="center">
	<tr>
		<td width=''><font color='red'>当前用户：${sessionScope.logUser.username}</font>
		</td>
	</tr>
	<tr>
		<td width='150'><a href="house/find_for_me?userId=${sessionScope.logUser.userId}">管理我的租房信息</a></td>
	</tr>
	<tr>
		<td width='100'><a href="views/post.jsp">发布租房信息</a></td>
	</tr>
	<tr>
		<td width='100'><a href="house/search">返回首页</a></td>
	</tr>
	<tr>
		<td width='100'><a href="index.htm">[注销]</a></td>
	</tr>
	</table>
</td>
    <td width="35" background="images/layout_24.gif">&nbsp;</td>
    <td width="495">
	<table>
		<tr>
			<td width="3%">&nbsp;</td>
			<td width="97%">
			<table width='450' border='0'>
				<tr>
					<TD>标题</TD>
					<TD width='100' align='center'>月租金</TD>
					<TD width='110'align='center'>发布日期</TD>
					<TD width='50'>&nbsp;</TD>
					<TD width='50'>&nbsp;</TD>
				</tr>
				<tr>
					<td colspan='5'><hr/></td>
				</tr>
				<!-- 显示的我的出租信息 -->
			<c:forEach var="h" items="${houseList}">
				<tr>
					<td><a href='house/findById/${h.id}'>${h.title}</a></td>
					<td align='center' style='height:30px;'><fmt:formatNumber value="${h.price}" pattern="#,###.00"/>元</td>
					<td align='center' style='height:30px;'>
						<fmt:formatDate value="${h.pubdate}" pattern="yyyy-MM-dd"/>
					</td><%--  house/findById/3 --%>
					<td align='center' style='height:30px;'><a href='house/manage/toUpdate/${h.id}'>[修改]</a></td>
					<td align='center' style='height:30px;'><a href='#'>[删除]</a></td>
				</tr>
			</c:forEach>
				
				<tr>
					<td colspan='5'><hr/></td>
				</tr>
				<!-- 分页链拉 -->
				<tr class="page-nav">
					<td colspan='5'>
						总记录：${page.getTotal()} &nbsp;&nbsp; 第${page.getPageNum()}页/共${page.getPages()}页
						&nbsp;&nbsp; &nbsp;&nbsp;
						<c:if test="${page.getPageNum() gt 1}">
							<a href="house/find_for_me?pageNum=1&userId=${sessionScope.logUser.userId}">第一页</a> &nbsp;
						</c:if>
						<c:if test="${page.getPageNum() gt 1}">
							<a href="house/find_for_me?pageNum=${page.getPageNum()-1}&userId=${sessionScope.logUser.userId}">上一页</a>&nbsp;
						</c:if>
						<c:if test="${page.getPageNum() lt page.getPages()}">
							<a href="house/find_for_me?pageNum=${page.getPageNum()+1}&userId=${sessionScope.logUser.userId}">下一页</a>&nbsp;
						</c:if>
						<c:if test="${page.getPageNum() lt page.getPages()}">
							<a href="house/find_for_me?pageNum=${page.getPages()}&userId=${sessionScope.logUser.userId}">末页</a>&nbsp;
						</c:if>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
	</table>
	</td>
    <td width="40" background="images/middle4.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><img src="images/bottom.jpg" width="780" height="82"></td>
  </tr>
</table>
<P align="center">2018 搜房网 版权所有</P>
<br/>
</BODY>
</HTML>