<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>登录页面</title>
<style type="text/css">
#bg {
	position: absolute;
	width: 600px;
	height: 310px;
	left: 20px;
	bottom: 160px;
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

<body>
<body align="center"
	style="background: url(images/登录背景图1.jpg) no-repeat; background-size: 100% 100%; background-attachment: fixed">
<body style="color: black" />
<br />
<br />
<br />
<br />
<div id="bg">

	<fieldset
		style="background-color: #F5F5F5; border-color: black; border-width: 3px; top: 100px;">
		<form name="regForm" action="UserLogin" method="post"
			style="background-color: #F5F5F5; top: 100px;">
			<legend align="center">
				<h1>用户登录</h1>
			</legend>
			<br /> <br />

			<p>
				<strong>用户名</strong>&nbsp;<input type="text" name="userid" />
			</p>
			<br />
			<p>
				<STRONG>密&nbsp;码</STRONG>&nbsp;<input type="password" name="userpwd" />
			</p>
			<br />
			<p>
				<STRONG>验证码</STRONG>&nbsp;<input type="text" name="code" size="10" /> <img
							name="verificate" border=0 src="VerificationCode.jsp"
							onclick="refresh()"/>
			</p>
			<br />
			<p>
				<a href="Register.jsp"> <input
					style="background-color: #6495ED; color: white; width: 70px; height: 30px;"
					type="button" value="立即注册" /></a> &nbsp;&nbsp;<input
					style="background-color: #0000FF; color: white; width: 70px; height: 30px;"
					type="submit" value="登录" />
			</P>
		</form>
	</fieldset>
</div>
<script type="text/javascript">
	function refresh() {
		regForm.verificate.src = "VerificationCode.jsp?id=" + Math.random();
	}
</script>
</body>
</html>