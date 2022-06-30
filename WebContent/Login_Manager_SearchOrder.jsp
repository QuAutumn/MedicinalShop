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
	bottom: 0;
	/* “bottom:0 与 overflow” 结合使用的效果：当内容超出显示器时，自动添加本区域的滚动条，其他区域保持不变*/
	overflow: auto;
	/*除了上面的方式，还有一种是不定义bottom，也不用overflow，这样内容是多少，中间内容区的行高就是多少，自适应，但是菜单和标题栏就会随着滚轮而动*/
}

table.cartProductTable th.selectAndImage {
	width: 100 px;
}

table.cartProductTable th {
	font-weight: normal;
	color: #3C3C3C;
	padding: 20px 20px;
}

img.cartProductImg {
	padding: 5px 30px;
	border: 1px solid #EEEEEE;
	width: 80px;
	height: 80px;
}

div.cartProductLinkOutDiv {
	position: relative;
}

span.cartProductItemPrice {
	padding: 5px 30px;
	color: #9C9C9C;
	display: block;
	font-size: 14px;
}

div.cartProductChangeNumberDiv {
	border: solid 1px #E5E5E5;
	width: 80px;
}

div.cartProductChangeNumberDiv a {
	width: 14px;
	display: inline-block;
	text-align: center;
	color: black;
	text-decoration: none;
}

div.cartProductChangeNumberDiv input {
	border: solid 1px #AAAAAA;
	width: 20px;
	display: inline-block;
}

span.cartProductItemSumPrice {
	padding: 5px 56px;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
}

.delete {
	padding: 5px 20px;
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
}

span.cartProductItemSumPrice {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
}

img.cartProductItemIfSelected, img.selectAllItem {
	cursor: pointer;
	right: 20px;
}

<!--
结算按钮-->body {
	font-size: 12px;
	font-family: Arial;
	left: 100px;
}

div.cartDiv {
	max-width: 1013px;
	margin: 10px auto;
	color: black;
}

div.cartTitle button {
	background-color: #AAAAAA;
	border: 1px solid #AAAAAA;
	color: white;
	width: 53px;
	height: 25px;
	border-radius: 2px;
}

span.cartTitlePrice {
	color: #C40000;
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
	margin-right: 3px;
}

div.cartFoot {
	line-height: 50px;
	margin: 20px 0px;
	color: black;
	padding-left: 20px;
}

div.cartFoot button {
	border: 0px solid #AAAAAA;
	color: white;
	height: height%;
	width: 120px;
	height: 50px;
	font-size: 20px;
	text-align: center;
}

span.cartSumNumber {
	color: #C40000;
	font-weight: bold;
	font-size: 16px;
}

span.cartSumPrice {
	color: #C40000;
	font-weight: bold;
	font-size: 20px;
}
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
<link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="static/js/sweetalert2.min.css" />
<link href="static/css/cartStyle.css" rel="stylesheet">
</script>
<script src="sweetalert-master/docs/assets/sweetalert/sweetalert.min.js"></script>
<body>
	<div class="contain">
		<div class="top">
			<div class="system">网上药店后台管理</div>
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
						<a href="MANAGER_SearchUserServlet?page=${page }">
							<li class="lastli">用户管理</li>
						</a>
						<a href="MANAGER_ProductServlet">
							<li onclick="goodstype()">商品管理</li>
						</a>
						<a href="ManagerSearchOrder">
							<li class="lastli">订单管理</li>
						</a>
						<a href="#">
							<li class="lastli">公告管理</li>
						</a>
					</ul>
				</div>
			</div>
			<div id="right_content">
				<table class="cartProductTable" id="list">
					<thead>
						<tr>
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
						<!-- 循环遍历订单 -->
						<c:forEach items="${managerorder }" var="item">

							<tr align="center">
								<!-- 此处显示图片 -->
								<td><img width="120px" src="${item.getPHOTO() }"
									class="cartProductImg"></td>
								<td>

									<div class="cartProductLinkOutDiv">${item.getPRODUCT_NAME() }</div>
								</td>
								<td><span class="cartProductLinkOutDiv">${item.getORDER_ID() }</span>
								</td>

								<td><span class="cartProductChangeNumberDiv">${item.getNUM() }</span>
								</td>
								<td><span class="cartProductItemSumPrice">${item.getTOTALPRICE() }</span>
								</td>
								<td><span class="cartProductLinkOutDiv">${item.getUSER_NAME() }</span></td>
								<td><span class="cartProductLinkOutDiv">${item.getPHONE() }</span></td>
								<td><span class="cartProductLinkOutDiv">${item.getADDRESS() }</span>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>