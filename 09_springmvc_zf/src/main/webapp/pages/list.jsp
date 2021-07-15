<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<HTML>
<HEAD>
<base href="${pageContext.request.contextPath}/">
<TITLE>搜房网租房</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script src="js/jquery-2.2.4.js" type="text/javascript"></script>

<link href="style/mycss.css" rel="stylesheet" type="text/css" />
<link href="style/texts.css" rel="stylesheet" type="text/css" />
<link href="style/btn.css" rel="stylesheet" type="text/css" />
<style>
	.page-nav a{color: #5285c5;}
</style>
<script language="javascript">
//document ready
$(function () {})
// jquery高级的AJAX函数：$.get("url", {name: val}|"name=value&name2=val2", function(){}), $.post(). $("selector").load()
// jquery底层的AJAX函数：$.ajax(), 可以用更多的选项来控制请求行为
//	$.ajax("url",{setting});  settings:AJAX 请求设置。所有选项都是可选的。
</script>
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

</script>
	<table align="center">
	<tr>
		<td width=''><font color='red'>当前用户：${sessionScope.logUser.username} </font>
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
    
    <form action="house/search" method="post" name="mf">
		<script>
		function fswitch(id){
			var o = document.getElementById(id);
			if (o){
				if (o.style.display == "none"){ o.style.display = "block"; } else {o.style.display = "none";}
			}
		}
		</script>

		<div style="text-align:left;width:88%;">
			标题：<input type="text" name="title" value="${sessionScope.selective.title}">
			<input type="submit" value="查询" class="btn"> <span onclick="fswitch('advSearch');" style="cursor:hand;color:blue;">高级搜索</span>
		</div>
		<table width="88%;" id="advSearch" style="border:solid 0px #000;display:none;">
			<tr>
				<td>区县：</td>
				<td>
					<select id="qxid" style="width:80px">
						<option value=''>不限--</option>
					</select>
				</td>
				<td rowspan="6">&nbsp;</td>
			</tr>
			<tr>
				<td>街道：</td>
				<td>
					<select id="streetId" name="streetId" style="width:80px">
						<option value="">不限--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>租金：</td>
				<td>
					<input type="text" name="lowPrice" size="5" class="unnamed1" value="${sessionScope.selective.lowPrice}">
					至 <input type="text" name="hiPrice" size="5" class="unnamed1" value="${sessionScope.selective.hiPrice}"> 元/月
				</td>
			</tr>
			<tr>
					<td colspan='3'><hr/></td>
			</tr>

		</table>
	</form>
	
	<table>
		<tr>
			<td width="3%">&nbsp;</td>
			<td width="97%">
			
			<table>
				<tr>
					<TD width='250'>标题</TD>
					<TD width='90' align='center'>月租金</TD>
					<TD align='center'>发布日期</TD>
				</tr>
				<tr>
					<td colspan='3'><hr/></td>
				</tr>
			<c:forEach var="house" items="${houseList}" varStatus="stat">
				<tr>
					<td>${stat.count} <a href='house/viewdetail/${house.id}'>${house.title}</a></td>
					<td align='center' style='height:30px;'>${house.price }元</td>
					<td align='center'>
						<fmt:formatDate value="${house.pubdate}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan='3'><hr/></td>
				</tr>
				<!-- 分页栏 -->
				<tr class="page-nav">
					<td colspan='3'>
						总${houseList.getTotal()}条 &nbsp;&nbsp; 第${houseList.getPageNum()}页/共${houseList.getPages()}页
						&nbsp;&nbsp; &nbsp;&nbsp;
						<c:if test="${houseList.getPageNum() gt 1}">
							<a href="house/select_for_page?pageNum=1">第一页</a> &nbsp;
						</c:if>
						<c:if test="${houseList.getPageNum() gt 1}">
							<a href="house/select_for_page?pageNum=${houseList.getPageNum()-1}">上一页</a>&nbsp;
						</c:if>
						<c:if test="${houseList.getPageNum() lt houseList.getPages()}">
							<a href="house/select_for_page?pageNum=${houseList.getPageNum()+1}">下一页</a>&nbsp;
						</c:if>
						<c:if test="${houseList.getPageNum() lt houseList.getPages()}">
							<a href="house/select_for_page?pageNum=${houseList.getPages()}">末页</a>&nbsp;
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