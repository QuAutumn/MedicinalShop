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
						<a href="UserSearchOrder">
							<li class="lastli">订单查询</li>
						</a>
						<a href="#">
							<li class="lastli">系统设置</li>
						</a>
					</ul>
				</div>
			</div>
			<div id="right_content">
				<form>
					<table class="cartProductTable" id="list">
						<thead>
							<tr>
								<th width="120px">产品图片</th>
								<th>商品信息</th>
								<th>单价</th>
								<th>数量</th>
								<th>金额</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<!-- 循环遍历商品 -->
							<c:forEach items="${cartlist }" var="item">

								<tr>
									<!-- 此处是购物车显示图片 -->
									<td><img width="120px" src="${item.getPHOTO() }"
										class="cartProductImg"></td>
									<td>

										<div class="cartProductLinkOutDiv">${item.getNAME() }</div>
									</td>
									<td><span class="cartProductItemPrice" id="5">${item.getPRICE() }<strong><font
												color=black>￥</font></strong></span></td>

									<td>
										<div class="cartProductChangeNumberDiv">
											<input type="button" name="minus" value="-"
												class="numberMinus" /> <input name="pronum" type="text"
												value="${item.getNUM() }" class="textNum"
												style="text-align: center;" /> <input type="button"
												name="add" value="+" class="numberPlus" />
										</div>
									</td>
									<td><span class="cartProductItemSumPrice">${item.getPRICE()*item.getNUM()}</span>
										<strong>￥</strong></td>
									<td class="delete"><a
										href="javascript:Delete('你确定要删除【${item.NAME }】这个商品吗？',
									'/MedicinalShop/UserDelCart?uid=${item.USER_ID }
									&proid=${item.PRODUCT_ID }')">
											<button style="background-color: red; color: white;"
												onclick="deleteInfo()">删除</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				<div class="cartFoot">
					<img class="selectAllItem">
					<div class="pull-right">
						<span>已选商品 <span class="cartSumNumber" id="cartSumNumber">0</span>
							件
						</span> <span>合计 : </span><span class="cartSumPrice" id="Sum">
							￥0.00</span> <a href="#"><button class="createOrderButton"
								style="background-color: red;">结算</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//减号操作
	$(".numberMinus").click(function() {
		var num = $(this).siblings(".textNum").val(); //获取数量框里的数值
		//单价的值
        var productPrice=parseInt($(this).parent().parent().prev().children("span").text());
		num--; //单击“-”减号时，数量递减
		if (num <= 0) {
			alert("至少加购1件！");
			$(this).siblings(".textNum").val(num+1); //把数量变化后的新值放入数量框中
			$(this).parent().parent().next().children("span").text((num+1)*productPrice);
          	
		}
		else{
			$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中
			$(this).parent().parent().next().children("span").text(num*productPrice);
           	
		}
		 totalPrice();	//调用总价方法
         totalNum();	//合计数
	})
	//加号操作
	$(".numberPlus").click(function() {
		var num = $(this).siblings(".textNum").val(); //获取数量框里的数值
		//单价的值
        var productPrice=parseInt($(this).parent().parent().prev().children("span").text());
		num++; //单击“+”减号时，数量递增
		if (num > 0) {
			$(this).siblings(".numberMinus").prop("disabled", false);
		}
		if(num>5){
			alert("最多加购5件！");
			$(this).siblings(".textNum").val(num-1); //把数量变化后的新值放入数量框中
			$(this).parent().parent().next().children("span").text((num-1)*productPrice);
           	
		}
		else{
			$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中
			$(this).parent().parent().next().children("span").text(num*productPrice);	
		}
		 totalPrice();	//调用总价方法
         totalNum();	//合计数
	})
	//计算总价方法
	function totalPrice(){
		//计算总价，编写总价方法
             var zong = 0;
             $(".cartProductItemSumPrice").each(function () {
                 var all = parseInt($(this).text());
                 zong += all;
             })
             $("#Sum").text(zong);
	}
	//计算数量方法
	function totalNum(){
		//计算总价，编写总价方法
             var sumNum = 0;
             $(".textNum").each(function () {
                 var all = parseInt($(this).val());
                 sumNum += all;
             })
             $("#cartSumNumber").text(sumNum);
	}
	//加载页面时，调用总价方法
	$(function(){
		 totalNum();
		 totalPrice();	//调用总价方法
	})
	function Delete(mess,url){
		if(confirm(mess)){
			location.href=url;
		}
	}
	</script>
</body>
</html>