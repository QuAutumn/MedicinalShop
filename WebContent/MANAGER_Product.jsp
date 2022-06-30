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

.mainfooter {
	position: absolute;
	top: 75px;
	left: 240px;
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
				<div class="mainfooter">
					<a href="MANAGER_AddProduct.jsp"><input
						style="background-color: #6495ED; color: white; width: 70px; height: 30px;"
						type="button" value="添加商品"></a>

					<table border="1" align="center">
						<tr align="center">
							<th>商品ID</th>
							<th>商品名称</th>
							<th>商品图片</th>
							<th>商品价格</th>
							<th>商品库存</th>
							<th>商品类别</th>
							<th>操作</th>
						</tr>
						<c:forEach var="p" items="${product }">
							<tr align="center">
								<td>${p.PRODUCT_ID }</td>
								<td>${p.PRODUCT_NAME }</td>
								<td><img src="${p.PRODUCT_PHOTO }" width="150" height="150" /></td>
								<td>${p.PRODUCT_PRICE }</td>
								<td>${p.PRODUCT_NUM }</td>
								<td>${p.PRODUCT_PID }</td>
								<td><a
									href="MANAGER_UpdateProductServlet?pid=${p.PRODUCT_ID }"> <font
										color=blue>修改</font></a>&nbsp <a
									href="javascript:Delete('你确定要删除商品【${p.PRODUCT_NAME }】吗？',
									'/MedicinalShop/MANAGER_DelProductServlet?pid=${p.PRODUCT_ID }')"><font
										color=red>删除</font></a></td>
							</tr>
						</c:forEach>
					</table>
					<table>
						<td align="center">共${totalProduct2 }条记录,当前${page2 }/${totalPages2 }页
							<a href="MANAGER_ProductServlet?page=1"><font color=blue>首页</font></a>
							<a href="MANAGER_ProductServlet?page=${page2-1<1?1:page2-1 }"><font
								color=blue>上一页</font></a> <a
							href="MANAGER_ProductServlet?page=${page2+1>totalPages2?totalPages2:page2+1 }"><font
								color=blue>下一页</font></a> <a
							href="MANAGER_ProductServlet?page=${totalPages2 }"><font
								color=blue>尾页</font></a>
						</td>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		function Delete(mess,url){
			if(confirm(mess)){
				location.href=url;
			}
		}
	</script>
</body>
</html>