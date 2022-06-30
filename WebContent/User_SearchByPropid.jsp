<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.medicinalshop.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	padding: 15px;
	text-align: left;
	background: white;
	height: 100px;
}

.header h1 {
	font-size: 50px;
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

/* 图像 */
.photo {
	background-color: #aaa;
	width: 100%;
	padding: 50px;
	float: left;
}

/* 为文章添加卡片效果 */
.card {
	background-color: white;
	width: 85%;
	padding: 20px;
	margin-top: 20px;
}

/* 清除列之后的浮动 */
.row:after {
	content: "";
	display: table;
	clear: both;
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
</style>
</head>
<body>
	<div class="header">
		<form action="ProductSearchServlet" method="get">
			<div class="leftcolumn">
				<img src="images/药店LOGO.png" width="250" height="70" /> <input
					type="text" placeholder="请输入关键字" name="proname"> <input
					type="submit" value="搜索">
			</div>
			<div class="rightcolumn">
				欢迎您：${uname}! <a href="UserLogout"><input type="button"
					value="退出登录" /></a> <a href="#"><input type="button" value="个人中心"></a>
			</div>
		</form>
	</div>

	<div class="topnav">
		<a href="ProductSearchServlet?proname="+"">网站首页</a> <a
			href="SearchProduct_PID?propid=<%="感冒咳嗽"%>">感冒咳嗽</a> <a
			href="SearchProduct_PID?propid=<%="解热镇痛"%>">解热镇痛</a> <a
			href="SearchProduct_PID?propid=<%="儿科用药"%>">儿科用药</a> <a
			href="SearchProduct_PID?propid=<%="补益安神"%>">补益安神</a> <a
			href="SearchProduct_PID?propid=<%="心脑血管"%>">心脑血管</a> <a
			href="SearchProduct_PID?propid=<%="家庭常备"%>">家庭常备</a> <a
			href="SearchProduct_PID?propid=<%="肠胃用药"%>">肠胃用药</a> <a
			href="SearchProduct_PID?propid=<%="皮肤用药"%>">皮肤用药</a>
	</div>


	<div class="photo">
		<table cellpadding="10" align="center">
			<tr>
				<c:forEach var="p1" items="${propid }">

					<td align="center">
						<p>
							<a href="ProductViewServlet?proid=${p1.PRODUCT_ID }"><img
								src="${p1.PRODUCT_PHOTO }" width="150" height="150" /></a>
						</p> <a href="ProductViewServlet?proid=${p1.PRODUCT_ID }">${p1.PRODUCT_NAME }<br />售价:${p1.PRODUCT_PRICE }
					</a>
					</td>
				</c:forEach>
			</tr>
		</table>
		<hr>
		<table align="center">
			<td>共${totalProduct1 }条记录,当前${page }/${totalPages1 }页 <a
				href="ProductSearchServlet?page=1">首页</a> <a
				href="ProductSearchServlet?page=${page-1<1?1:page-1 }">上一页</a> <a
				href="ProductSearchServlet?page=${page+1>totalPages1?totalPages1:page+1 }">下一页</a>
				<a href="ProductSearchServlet?page=${totalPages1 }">尾页</a>
			</td>
		</table>
	</div>
</body>
</html>