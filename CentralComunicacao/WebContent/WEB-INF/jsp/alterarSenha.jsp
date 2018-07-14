<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Central de Comunicação</title>
</head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Autenticação de Usuário</title>
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	<h1>Alteração de Senha</h1>
	<c:if test="${mensagens.existeErros}">
		<div id="erro">
			<ul>
				<c:forEach var="erro" items="${mensagens.erros}">
					<li>${erro}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<form method="post" action="mvc?logica=AlterarSenha">
		<table>
			<tr>
				<th>Login:</th>
				<td><input type="text" name="matricula"
					value="${param.matricula}" /></td>
			</tr>
			<tr>
				<th>Senha Antiga:</th>
				<td><input type="password" name="senhaAntiga" /></td>
			</tr>
			<tr>
				<th>Senha Nova:</th>
				<td><input type="password" name="senhaNova1" /></td>
			</tr>
			<tr>
				<th>Confirma a Senha Nova:</th>
				<td><input type="password" name="senhaNova2" /></td>
			</tr>


			<tr>
				<td colspan="2"><input type="submit" name="bOK" value="Entrar" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="bOFF" value="Sair" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>