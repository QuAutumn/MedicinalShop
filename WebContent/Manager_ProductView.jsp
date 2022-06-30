<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.medicinalshop.dao.*"%>
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
	padding: 15px;
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
</style>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
</head>
<body>
	<div class="header">

		<div class="leftcolumn">
			<img src="images/药店LOGO.png" width="250" height="70" />

		</div>
		<div class="itemdetail" align="center">商品详情</div>
		<div class="rightcolumn">
			<a href="ProductSearchServlet?proname="+""><input type="button"
				value="返回首页" /></a> <a href="UserLogout"><input type="button"
				value="退出登录" /></a> <a href="MANAGER_SearchUserServlet?keyword=null"><input
				type="button" value="后台管理"></a>
		</div>

	</div>
	<div class="maintop">
		<center>
			<form action="UserAddProductCart" method="post">
				<table width="750" height="60" cellpadding="0" cellspacing="0"
					border="0">
					<tr>
						<td width="70%" valign="bottom" top="10px">
							<table>
								<tr>
									<td rowspan="6"><img src="${viewpro.PRODUCT_PHOTO }"
										width="330" height="300"></td>
								</tr>
								<tr>
									<td id="item_name"><b>商品名称:${viewpro.PRODUCT_NAME }</b></td>
								</tr>
								<tr>
									<td><font size="5">价格 ¥:${viewpro.PRODUCT_PRICE }</font></td>
								</tr>
								<tr>
									<td>
										<div class="ProductChangeNumberDiv">
											数量&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="minus"
												value="-" class="numberMinus" /> <input type="text"
												name="pronum" value="1" class="textNum"
												style="text-align: center;" />
											<!-- 应该限制库存 ，未做-->
											<input type="button" name="add" value="+" class="numberPlus" />
											&nbsp;件
									</td>
									</div>
								</tr>
								<tr>
									<td><a href="#"><input
											style="color: white; background-color: #FF9797; height: 45; width: 150;"
											type="submit" value="加入购物车"></a></td>
								</tr>
								<tr>
									<td><a href="#"><input
											style="color: white; background-color: red; height: 45; width: 150;"
											type="button" value="直接购买"></a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</div>
	<script type="text/javascript">
		//减号操作
		$(".numberMinus").click(function() {
			var num = $(this).siblings(".textNum").val(); //获取数量框里的数值
			num--; //单击“-”减号时，数量递减
			if (num <= 0) {
				alert("至少加购1件！");
				$(this).siblings(".textNum").val(num+1); //把数量变化后的新值放入数量框中
			}
			else
				$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中

		})
		//加号操作
		$(".numberPlus").click(function() {
			var num = $(this).siblings(".textNum").val(); //获取数量框里的数值

			num++; //单击“+”减号时，数量递增
			if (num > 0) {
				$(this).siblings(".numberMinus").prop("disabled", false);
			}
			if(num>5){
				alert("最多加购5件！");
				$(this).siblings(".textNum").val(num-1); //把数量变化后的新值放入数量框中
			}
			else
				$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中
		})
	</script>
</body>
</html>