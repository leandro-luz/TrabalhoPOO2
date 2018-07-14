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
	<h1>Autenticação de Usuário</h1>
	<c:if test="${mensagens.existeErros}">
		<div id="erro">
			<ul>
				<c:forEach var="erro" items="${mensagens.erros}">
					<li>${erro}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<form method="post" action="mvc?logica=Login">
		<table>
			<tr>
				<th>Login:</th>
				<td><input type="text" name="matricula" value="${param.matricula}" /></td>
			</tr>
			<tr>
				<th>Senha:</th>
				<td><input type="password" name="senha" /></td>
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
		<form method="post" action="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/alterarSenha.jsp">
		<table>
			<tr>
				<td colspan="2"><input type="submit" name="bOK" value="Trocar Senha" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>