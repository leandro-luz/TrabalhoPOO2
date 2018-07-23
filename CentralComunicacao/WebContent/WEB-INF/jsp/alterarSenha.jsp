<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Central comunicação</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Autenticação de Usuário</title>

</head>
<body>

	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	

	<c:if test="${mensagens.existeErros}">
		<div id="erro">
			<ul>
				<c:forEach var="erro" items="${mensagens.erros}">
					<li>${erro}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	
	<!-- FORMULÁRIO DE LOGIN -->
		<div class="w3-container w3-padding-16" >
		
		  <div id="id01" class="w3-content">
			<div class="w3-modal-content w3-card-4" style="max-width:600px">
			  <form class="w3-container" method="post" action="mvc?logica=AlterarSenha">
				<div class="w3-section">
				  <label><b>Usuário</b></label>
				  <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Digite o usuário" name="matricula" value="${param.matricula}"/>
				  <label><b>Senha antiga</b></label>
				  <input class="w3-input w3-border" type="password" placeholder="Digite a senha antiga" name="senhaAntiga"/>
				  <label><b>Nova senha</b></label>
				  <input class="w3-input w3-border" type="password" placeholder="Digite a nova senha" name="senhaNova1"/>
				  <label><b>Confirmação da nova senha</b></label>
				  <input class="w3-input w3-border" type="password" placeholder="Confirme a nova senha" name="senhaNova2"/>
				  
				  <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit" name="bOK" value="Entrar" >Alterar</button>
				  <button class="w3-button w3-block w3-gray w3-section w3-padding" type="submit" name="bOFF" value="Sair">Sair</button>
				</div>
			  </form>

			</div>
		  </div>
    	</div>
    <!-- CODIGO ANTIGO	
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
	 -->
</body>
</html><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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