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

.user {
	float: right;
	margin-right: 2%;
	color: #37080a;
}

/*中间内容区*/
.content {
	height: 400px;
	background-color: #daffea;
	width: 100%;
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
	left: 400px;
	top: 80px;
	height: 10px;
	background-color: #daffea;
	bottom: 0;
}

.mainfooter {
	position: absolute;
	top: 150px;
	left: 200px;
}

.pagination {
	position: absolute;
	top: 280px;
	left: 180px;
}
</style>
<body>
	<div class="contain">
		<div class="top">
			<div class="system">网上药店个人中心</div>
			<div class="user">
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
						<a href="USER_PersonalData">
							<li class="lastli">个人信息</li>
						</a>
						<a href="SearchCartByUID">
							<li class="lastli">购物车管理</li>
						</a>
						<a href="#">
							<li class="lastli">订单查询</li>
						</a>
						<a href="#">
							<li class="lastli">系统设置</li>
						</a>
					</ul>
				</div>
			</div>
			<div id="right_content">
				<div class="maintop">
					<fieldset
						style="background-color: #F5F5F5; border-color: black; border-width: 3px; top: 100px; height: 380px; width: 250px;">
						<legend align="center">
							<font color=blue size="4">个人信息</font>
						</legend>
						<br>
						<form action="USER_PersonalDataUpdate" method="post">
							<p>
								用户名 <input type="text" readonly="true" name="uid"
									value="${userdata.getUSER_ID() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;姓&nbsp;&nbsp;名&nbsp;<input type="text" name="uname"
									value="${userdata.getUSER_NAME() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;密&nbsp;&nbsp;码&nbsp;<input type="text" name="upwd"
									value="${userdata.getUSER_PASSWORD() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;性&nbsp;&nbsp;别&nbsp;<input type="text" name="usex"
									value="${userdata.getUSER_SEX() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;生&nbsp;&nbsp;日&nbsp;<input type="text" name="ubirth"
									value="${userdata.getUSER_BIRTHDAY() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;手&nbsp;&nbsp;机&nbsp;<input type="text" name="uphone"
									value="${userdata.getUSER_PHONE() }">
							</p>
							<br>
							<p>
								&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;
								<textarea cols="17" rows="2" name="uaddress">${userdata.getUSER_ADDRESS() }</textarea>
							</p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><input
								style="background-color: #649511; color: white; width: 70px; height: 30px;"
								type="button" value="返回"></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input
								style="background-color: #6495ED; color: white; width: 70px; height: 30px;"
								type="submit" value="更新">
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</body>
</html>