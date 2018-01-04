<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>websocket</title>
<script type="text/javascript" src="${ctx }/resources/js/jquery.min.js"></script>
<script type="text/javascript">
var webSocket;
$(function(){
	$('#login').click(function(){
		webSocket = new WebSocket('ws://localhost:8080/ws_demo1/mywebsocket');
		
		webSocket.onerror = function(event) {
			alert(event.data);
		};
		
		webSocket.onmessage = function(event) {
			$('#messages').html($('#messages').html()+'<br>'+event.data);
		};
		
		webSocket.onopen = function(event) {
			$('#messages').html('Connection established');
			$('#loginForm').hide();
			$('#connContent').show();
		};
	});
	
	
	$("#send").click(function(){
		webSocket.send($('#content').val());
	});
});

	
</script>
</head>
<body>
	<div id="loginForm">
		<input type="button" id="login" value="login" />
	</div>
	<div id="connContent" style="display:none;">
		<textarea id="content"></textarea>
		<input type="button" id="send" value="send"/>
	</div>
	<div id="messages"></div>

</body>
</html>