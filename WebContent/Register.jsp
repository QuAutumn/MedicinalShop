<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Calendar" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>注册页面</title>
<style type="text/css">
span {
	color: red;
}

#bg {
	position: absolute;
	width: 400px;
	height: 200px;
	left: 80px;
	bottom: 230px;
}

td.right {<!--
	名字 --> text-align: right;
	height: 25px;
	<!--
	文本-对齐属性：右对齐；表格高度：25px
	-->
}
</style>
</head>


<body align="center"
	style="background: url(images/登录背景图1.jpg) no-repeat; background-size: 100% 100%; background-attachment: fixed">
	<div id="bg">

		<fieldset
			style="background-color: #F5F5F5; border-color: black; border-width: 3px; top: 100px;">
			<form name="regForm" action="UserRegisterServlet" method="post"
				style="background-color: #F5F5F5;">
				<legend align="center">
					<h1>用户注册</h1>
				</legend>
				<br /> <br />
				<table>
					<tr>
						<td class="right"><strong>用户名</strong></td>
						<td><input type="text" name="userid" onblur="check()" /></td>
						<td><span id="checkDiv"></span></td>
					</tr>
					<tr>
						<td class="right"><strong>密码</strong></td>
						<td><input type="password" name="userpwd" /></td>
					</tr>
					<tr>
						<td class="right"><strong>确认密码</strong></td>
						<td><input type="password" name="confirmpwd" /></td>
					</tr>
					<tr>
						<td class="right"><strong>姓名</strong></td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td class="right"><strong>性别</strong></td>
						<td><input type="radio" name="sex" value="男" checked>男
							<input type="radio" name="sex" value="女">女</td>
					</tr>
					<tr>
						<td class="right"><strong>出生日期</strong></td>
						<td><select style="width: 53px;" id="birthYear"
							name="birthYear" class="date">
								<option value="">年</option>
								<c:forEach begin="1980"
									end="<%=Calendar.getInstance().get(Calendar.YEAR)%>"
									var="year">
									<option value="${year}">${year }</option>
								</c:forEach>
						</select> <select style="width: 50px;" id="birthMonth" name="birthMonth"
							class="month">
								<option value="">月</option>
								<c:forEach begin="1" end="12" var="month">
									<option value="${month }">${month }</option>
								</c:forEach>
						</select> <select style="width: 50px;" id="birthDay" name="birthDay"
							class="day">
								<option value="">日</option>
								<c:forEach begin="1" end="31" var="day">
									<option value="${day }">${day }</option>
								</c:forEach>
						</select></td>
					<tr>
						<td class="right"><strong>验证码</strong></td>
						<td><input type="text" name="code" size="10" /> <img
							name="verificate" border=0 src="VerificationCode.jsp"
							onclick="refresh()"></td>
					</tr>
					<tr>
						<td class="right"><a href="Login.jsp"><input
								style="background-color: #4169E1; color: white; width: 70px; height: 30px;"
								type="button" value="已有帐户"></a></td>
						<td><input
							style="background-color: #6495ED; color: white; width: 70px; height: 30px;"
							type="button" onclick="checkpwd()" value="立即注册" /></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
	<script type="text/javascript" contentType="text/html; charset=UTF-8">
		function check() {
			var userid = document.regForm.userid.value;
			var xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			var url = "/MedicinalShop/UserSearchByIDServlet?userid=" + userid;
			xmlHttp.open("Get", url, true);
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					checkDiv.innerHTML = xmlHttp.responseText;
				} else {
					checkDiv.innerHTML = "正在查找用户ID...";
				}
			}
			xmlHttp.send();
		}
		function checkpwd() {
			var userid = document.regForm.userid.value;
			var userpwd = document.regForm.userpwd.value;
			var confirmpwd = document.regForm.confirmpwd.value;
			if (userid == "") {
				alert("用户名不能为空!");
				document.regForm.userid.focus();
				return;
			}
			if (userpwd == "") {
				alert("密码不能为空!");
				document.regForm.userpwd.focus();
				return;
			} else if (confirmpwd == "") {
				alert("确认密码不能为空!");
				document.regForm.confirmpwd.focus();
				return;
			}
			if (userpwd !== confirmpwd) {
				alert("两次输入密码需一致!");
				document.regForm.confirmpwd.focus();
				return;
			}
			document.regForm.submit();
		}
		function refresh() {
			regForm.verificate.src = "VerificationCode.jsp?id=" + Math.random();
		}
	</script>
</body>
</html>