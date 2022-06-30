<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.medicinalshop.dao.*,com.medicinalshop.entity.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
}

a {
	text-decoration: none;
	color: #f5fff5;
}

.contain {
	margin-left: 1%;
	width: 98%;
	border-left-width: 5px;
	border-right-width: 5px;
	border-top-width: 0px;
	height: 380px;
}
/*顶部*/
.top {
	padding-top: 10px;
	width: 100%;
	height: 60px;
}

.system {
	font-size: 30px;
	font-family: 华文新魏;
	float: left;
	color: #0ca0ff;
}

.admin {
	float: right;
	margin-right: 2%;
	color: #37080a;
}

/*中间内容区*/
.content {
	height: 400px;
	background-color: #daffea;
	width: 100%;
	overflow: auto;
}

.menu {
	width: 12%;
	float: left;
	height: 400px;
	background-color: #31372d;
}

.headimg_name {
	margin-top: 10px;
	text-align: center;
	font-size: 20px;
	color: #f5fff5;
}

.address {
	margin-top: 5px;
	text-align: center;
	font-size: 10px;
	color: rgba(255, 252, 229, 0.67);
}

.return {
	padding-top: 2px;
	margin-top: 10px;
	display: block;
	height: 25px;
	width: 50%;
	margin-left: 30%;
	margin-right: 30%;
	text-align: center;
	font-size: 10px;
	border-radius: 15px;
	color: #f5fff5;
	border-style: solid;
	border-width: 1px;
	border-color: blue;
}

.return:hover {
	color: #75ffdf;
}

.exit {
	padding-top: 2px;
	margin-top: 10px;
	display: block;
	height: 25px;
	width: 50%;
	margin-left: 30%;
	margin-right: 30%;
	text-align: center;
	font-size: 10px;
	border-radius: 15px;
	color: #f5fff5;
	border-style: solid;
	border-width: 1px;
	border-color: #75ffdf;
}

.exit:hover {
	color: #75ffdf;
}

.menu_ul {
	margin-top: 20px;
	color: #f5fff5;
}

img {
	border-radius: 50px;
}

li {
	display: block;
	list-style: none;
	height: 40px;
	border-top-width: 1px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	border-style: solid;
	padding-top: 15px;
}

.lastli {
	border-bottom-width: 1px;
}

li:hover {
	color: #75ffdf;
	border-left-width: 1px;
}

/*右侧内容部分*/
#right_content {
	width: 88%;
	float: left;
	height: 380px;
}

.maintop {
	position: absolute;
	left: 350px;
	top: 100px;
	height: 100px;
	background-color: #daffea;
}
</style>
<body>
	<div class="contain">
		<div class="top">
			<div class="system">网上药店后台管理</div>
			<div class="admin">
				<strong>欢迎您！${uname }</strong>&nbsp;
				<div class="return">
					<a href="ProductSearchServlet?proname="+"""><font color=black><strong>返回首页</strong></font></a>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="menu" align="center">
				<div class="headimg_name">${uname }</div>
				<div class="address">广东药科大学</div>
				<div class="exit">
					<a href="UserLogout">退出登录</a>
				</div>
				<div class="menu_ul">
					<ul>
						<a href="MANAGER_SearchUserServlet?page=${page }">
							<li class="lastli">用户管理</li>
						</a>
						<a href="MANAGER_ProductServlet">
							<li onclick="goodstype()">商品管理</li>
						</a>
						<a href="#">
							<li class="lastli">订单管理</li>
						</a>
						<a href="#">
							<li class="lastli">公告管理</li>
						</a>
					</ul>
				</div>
			</div>
			<div id="right_content">
				<div class="maintop">
					<fieldset
						style="background-color: #F5F5F5; border-color: black; border-width: 3px; top: 100px; height: 340px;">
						<form name="regForm" action="MANAGER_UpdateProductServlet"
							method="post" style="background-color: #F5F5F5; height: 340px;">
							<legend align="center">
								<font color=blue size="5">更改商品信息</font>
							</legend>
							<br />
							<p>
								商品I&nbspD&nbsp<input style="width: 205px;" type="text"
									readonly="true" name="proid" value="${p2.PRODUCT_ID }">
							</p>
							<br>
							<p>
								商品名称<input style="width: 200px;" type="text"
									value="${p2.PRODUCT_NAME }" name="proname">
							</p>
							<br>
							<p>
								商品图片<input style="width: 200px;" type="text"
									value="${p2.PRODUCT_PHOTO }" name="prophoto">
							</p>
							<br>
							<p>
								商品价格<input style="width: 200px;" type="text"
									value="${p2.PRODUCT_PRICE }" name="proprice">
							</p>
							<br>
							<p>
								商品库存<input style="width: 200px;" type="text"
									value="${p2.PRODUCT_NUM }" name="pronum">
							</p>
							<br>
							<p>
								商品类别<input style="width: 200px;" type="text"
									value="${p2.PRODUCT_PID }" name="propid">
							</p>
							<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input style="background-color: red; color: white; width: 70px;"
								type="reset" value="全部清空"> <input
								style="background-color: #6655EF; color: white; width: 70px;"
								type="submit" value="更改">
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</body>
</html>