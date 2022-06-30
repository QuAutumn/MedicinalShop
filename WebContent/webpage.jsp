<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
</head>

<style>
div.cartDiv {
	max-width: 1013px;
	margin: 10px auto;
	color: black;
}

table.cartProductTable {
	width: 100%;
	font-size: 12px;
}

tr.cartProductItemTR {
	border: 1px solid #CCCCCC;
}

tr.cartProductItemTR td {
	padding: 20px 20px;
}

table.cartProductTable th {
	font-weight: normal;
	color: #3C3C3C;
	padding: 20px 20px;
}

img.cartProductImg {
	padding: 1px;
	border: 1px solid #EEEEEE;
	width: 80px;
	height: 80px;
}

table.cartProductTable th.selectAndImage {
	width: 100px;
}

div.cartProductLinkOutDiv {
	position: relative;
}

a.cartProductLink {
	color: #3C3C3C;
}

a.cartProductLink:hover {
	color: #C40000;
	text-decoration: underline;
}

div.cartProductLinkInnerDiv {
	position: absolute;
	bottom: 0;
	height: 20px;
}

span.cartProductItemPrice {
	color: #9C9C9C;
	display: block;
	font-size: 14px;
}

span.cartProductItemPromotionPrice {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
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
	width: 23px;
	display: inline-block;
}

span.cartProductItemSumPrice {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
}

img.cartProductItemIfSelected, img.selectAllItem {
	cursor: pointer;
}

<!--
结算按钮-->body {
	font-size: 12px;
	font-family: Arial;
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
	background-color: #E5E5E5;
	line-height: 50px;
	margin: 20px 0px;
	color: black;
	padding-left: 20px;
}

div.cartFoot button {
	background-color: #AAAAAA;
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
<body>

	<form id="jiesuan" method="post" action="car">
		<div class="cartDiv">
			<div class="cartProductList">
				<c:if test="false">
					<h1>你未购买任何产品</h1>
				</c:if>
				<%--如果购物车有购物项，就应该把购物项的信息显示给用户--%>

				<table class="cartProductTable" id="list">
					<thead>
						<tr>
							<th>产品图片</th>
							<th>商品信息</th>
							<th>单价</th>
							<th>数量</th>
							<th width="120px">金额</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody>
						<!-- 循环遍历商品 -->
						<c:forEach items="${cartlist }" var="item">

							<tr>
								<!-- 此处是购物车显示图片 -->
								<td><img width="40px" src="#" class="cartProductImg">${item.getPHOTO()}</td>
								<td>

									<div class="cartProductLinkOutDiv">${item.getNAME()}</div>
								</td>
								<td><span class="cartProductItemPrice" id="5">${item.getPRICE()}</span>
									<strong>￥</strong></td>

								<td>
									<!-- 选择数量  ${item.productNum*item.price} 隐藏库存-->
									<div class="cartProductChangeNumberDiv">
										<input type="hidden" name="action" value="updateInfo">
										<input type="button" name="minus" value="-"
											class="numberMinus" /> <input type="text" name=${carListId }
											) value=${item.getNUM() } class="textNum"
											style="text-align: center;" />
										<!-- 应该限制库存 ，未做-->
										<input type="button" name="add" value="+" class="numberPlus" />
									</div>
								</td>
								<td><span class="cartProductItemSumPrice">${item.getTOTAL()}</span><strong>￥</strong>
								</td>
								<td><button onclick="deleteInfo()">删除</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

			<div class="cartFoot">
				<img class="selectAllItem">
				<div class="pull-right">
					<span>已选商品 <span class="cartSumNumber" id="cartSumNumber">0</span>
						件
					</span> <span>合计 : </span><span class="cartSumPrice" id="Sum">
						￥0.00</span>
					<button class="createOrderButton"
						style="background-color: rgb(170, 170, 170);"
						onclick="return orderInfo()">結算</button>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		//减号操作
		$(".numberMinus").click(
				function() {
					var num = $(this).siblings(".textNum").val(); //获取数量框里的数值
					//单价的值
					var productPrice = $(this).parent().parent().prev()
							.children("span").text();

					num--; //单击“-”减号时，数量递减
					if (num <= 0) {
						$(this).prop("disabled", true);
					}

					$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中
					//小计的值
					$(this).parent().parent().next().children("span").text(
							num * productPrice);
					totalPrice(); //调用总价方法
					totalNum(); //合计数
				})
		//加号操作
		$(".numberPlus").click(
				function() {
					var num = $(this).siblings(".textNum").val(); //获取数量框里的数值
					//单价的值
					var productPrice = $(this).parent().parent().prev()
							.children("span").text();

					num++; //单击“+”减号时，数量递减
					if (num > 0) {
						$(this).siblings(".numberMinus")
								.prop("disabled", false);
					}
					$(this).siblings(".textNum").val(num); //把数量变化后的新值放入数量框中
					//小计的值
					$(this).parent().parent().next().children("span").text(
							num * productPrice);
					totalPrice(); //调用总价方法
					totalNum(); //合计数
				})
		//计算总价方法
		function totalPrice() {
			//计算总价，编写总价方法
			var zong = 0;
			$(".cartProductItemSumPrice").each(function() {
				var all = parseInt($(this).text());
				zong += all;
			})
			$("#Sum").text(zong);
		}
		//计算数量方法
		function totalNum() {
			//计算总价，编写总价方法
			var sumNum = 0;
			$(".textNum").each(function() {
				var all = parseInt($(this).val());
				sumNum += all;
			})
			$("#cartSumNumber").text(sumNum);
		}
		//加载页面时，调用总价方法
		$(function() {
			totalNum();
			totalPrice(); //调用总价方法
		})

		function deleteInfo() {
			swal({
				title : "删除提示", //弹出框的title
				text : "确定删除吗？", //弹出框里面的提示文本
				type : "warning", //弹出框类型
				showCancelButton : true, //是否显示取消按钮
				confirmButtonColor : "#DD6B55",//确定按钮颜色
				cancelButtonText : "取消",//取消按钮文本
				confirmButtonText : "是的，确定删除！"//确定按钮上面的文档
			})
					.then(
							function(isConfirm) {
								if (isConfirm) {
									window.location = "car?action=delete&userId=1&carListId=1&productId=1";
								}
							});
		}
	</script>
</body>
</html>