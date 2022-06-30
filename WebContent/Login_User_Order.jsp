<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.medicinalshop.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="font-awesome-4.7.0/css/font-awesome.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial;
	padding: 10px;
	background: #f1f1f1;
}

/* 页眉/Blog 标题 */
.header {
	padding: 30px;
	text-align: left;
	background: white;
	height: 100px;
}

.header h1 {
	font-size: 50px;
}

.itemdetail {
	position: absolute;
	font-size: 50px;
	left: 380px;
	top: 40px;
}
/* 设置上导航栏的样式 */
.topnav {
	overflow: hidden;
	background-color: #333;
}

/* 设置 topnav 链接的样式 */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

/* 改变鼠标悬停时的颜色 */
.topnav a:hover {
	background-color: #ddd;
	color: black;
}

/* 创建两个不相等的彼此并排的浮动列 */
/* 左列 */
.leftcolumn {
	float: left;
	width: 85%;
}

/* 右列 */
.rightcolumn {
	float: left;
	width: 15%;
	background-color: white;
	padding-left: 20px;
}

#item_name {
	color: blue;
	font-size: 30px;
}

div.ProductChangeNumberDiv input {
	border: solid 1px #AAAAAA;
	width: 23px;
	display: inline-block;
}

/* 清除列之后的浮动 */
.row:after {
	content: "";
	display: table;
	clear: both;
}

.maintop {
	position: absolute;
	padding: 30px;
	top: 125px;
	width: 100%;
	height: 70%;
	background-color: #ddd;
	bottom: 0;
}

/* 页脚 */
.footer {
	padding: 20px;
	text-align: center;
	background: #ddd;
	margin-top: 20px;
}
/* 响应式布局 - 当屏幕的宽度小于 800 像素时，使两列堆叠而不是并排 */
@media screen and (max-width: 800px) {
	.leftcolumn, .rightcolumn {
		width: 100%;
		padding: 0;
	}
}

/* 响应式布局 - 当屏幕的宽度小于 400 像素时，使导航链接堆叠而不是并排 */
@media screen and (max-width: 400px) {
	.topnav a {
		float: none;
		width: 100%;
	}
}

table.cartProductTable th.selectAndImage {
	width: 100 px;
}

table.cartProductTable th {
	font-weight: normal;
	color: #3C3C3C;
	padding: 20px 20px;
}
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
</head>
<body>
	<%
	session.setAttribute("pnum",request.getParameter("pronum"));
	//取随机产生的订单编号（9位数字）
	Random rnd = new Random();
	int randNum = rnd.nextInt(899999999)+100000000;
	String order = String.valueOf(randNum);
	//将订单编号存入session
	session.setAttribute("order", order); 
	%>
	<div class="header">

		<div class="leftcolumn">
			<img src="images/药店LOGO.png" width="250" height="50" />

		</div>
		<div class="itemdetail" align="center">订单详情</div>
		<div class="rightcolumn">
			<a href="ProductSearchServlet?proname="+""><input type="button"
				value="返回首页" /></a> <a href="UserLogout"><input type="button"
				value="退出登录" /></a> <a href="USER_PersonalData"><input
				type="button" value="个人中心"></a>
		</div>

	</div>
	<div class="maintop">
		<form name="regForm" action="UserAddOrder" method="post">
			<table class="cartProductTable" id="list" align="center">
				<thead>
					<tr align="center">
						<th width="120px">产品图片</th>
						<th>商品名称</th>
						<th>订单编号</th>
						<th>数量</th>
						<th>金额</th>
						<th>姓名</th>
						<th>手机</th>
						<th>地址</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td><img width="120px" src="${viewpro.PRODUCT_PHOTO }""></td>
						<td>${viewpro.PRODUCT_NAME }</td>
						<td>${order }</td>
						<td>${pnum }</td>
						<td>${viewpro.PRODUCT_PRICE*pnum }</td>
						<td>${uname }</td>
						<td>${uphone }</td>
						<td>${uaddress }</td>
					</tr>
					<tr>
						<td colspan="8"></td>
					</tr>
					<tr align="center">
						<td colspan="4"><input
							style="background-color: orange; color: white; width: 80px; height: 40px;"
							type="button" value="再逛逛" onClick="reback()"></td>
						<td colspan="4"><input
							style="background-color: red; color: white; width: 80px; height: 40px;"
							type="submit" value="付款"></td>
					</tr>
				</tbody>
			</table>

		</form>
	</div>
	<script type="text/javascript">
	function reback() {
		var proid = 
		location.href="User_ProductView.jsp";
	}
	</script>
</body>
</html>