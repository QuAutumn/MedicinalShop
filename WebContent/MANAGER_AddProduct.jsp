<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.medicinalshop.dao.*,com.medicinalshop.entity.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
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
						style="background-color: #F5F5F5; border-color: black; border-width: 3px; top: 100px; height: 340px; width: 300px;">
						<legend align="center">
							<font color=blue size="4">请填写下列商品信息</font>
						</legend>
						<br>
						<form name="regForm" action="MANAGER_AddProductServlet"
							method="post">
							<p>
								&nbsp;商品&nbsp;I&nbsp;D <input type="text" name="proid"
									onblur="check()"> <span id="checkDiv"></span>
							</p>
							<br>
							<p>
								&nbsp;商品名称<input type="text" name="proname">
							</p>
							<br>
							<p>
								&nbsp;商品图片<input type="text" name="prophoto" value="images/">
							</p>
							<br>
							<p>
								&nbsp;商品价格<input type="text" name="proprice">
							</p>
							<br>
							<p>
								&nbsp;商品库存<input type="text" name="pronum">
							</p>
							<br>
							<p>
								&nbsp;商品类别 <select style="width: 100px;" id="propid"
									name="propid">
									<option value="感冒咳嗽">感冒咳嗽</option>
									<option value="解热镇痛">解热镇痛</option>
									<option value="儿科用药">儿科用药</option>
									<option value="补益安神">补益安神</option>
									<option value="心脑血管">心脑血管</option>
									<option value="家庭常备">家庭常备</option>
									<option value="肠胃用药">肠胃用药</option>
									<option value="皮肤用药">皮肤用药</option>
								</select>
							</p>
							<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								style="background-color: #4169E1; color: white; width: 70px; height: 30px;"
								type="reset" value="清空">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
								style="background-color: #6495ED; color: white; width: 70px; height: 30px;"
								type="submit" value="添加">
						</form>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" contentType="text/html; charset=UTF-8">
		function check(){
			var proid = document.regForm.proid.value;
			var xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			var url = "/MedicinalShop/MANAGER_AddProductServlet?proid="+proid;
			xmlHttp.open("Get",url,true);
			xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState==4){
					checkDiv.innerHTML = xmlHttp.responseText;
				}
				else{
					checkDiv.innerHTML = "正在验证商品ID...";
				}
			}
			xmlHttp.send();
		}
	</script>
</body>
</html>