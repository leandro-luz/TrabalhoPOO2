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
<title>Cadastro de Usuário</title>
<link href="${pageContext.request.contextPath}/css/layout.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	<h1>Cadastro de Usuário</h1>
	<c:if test="${mensagens.existeErros}">
		<div id="erro">
			<ul>
				<c:forEach var="erro" items="${mensagens.erros}">
					<li>${erro}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<c:if test="${noticias.existeAvisos}">
		<div id="aviso">
			<ul>
				<c:forEach var="aviso" items="${noticias.avisos}">
					<li>${aviso}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<form method="post" action="mvc?logica=AdicionaUsuarioLogica">
		<table>
			<tr>
				<th>Matricula:</th>
				<td><input type="number" name="matricula"></td>
			</tr>
			<tr>
				<th>Nome:</th>
				<td><input type="text" name="nome"></td>
			</tr>
			<tr>
				<th>Regional:</th>
				<td><select name="regional">
						<c:forEach var="regionais" items="${regionais}">
							<option value="${regionais}">${regionais}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>Email:</th>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="bOK" value="Salvar" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="bOFF" value="Voltar" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>