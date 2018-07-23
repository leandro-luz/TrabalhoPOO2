<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			  <form class="w3-container" method="post" action="mvc?logica=Login">
				<div class="w3-section">
				  <label><b>Matrícula</b></label>
				  <input class="w3-input w3-border w3-margin-bottom" type="number" placeholder="Digite sua matrícula" name="matricula" value="${param.matricula}"  required/>
				  <label><b>Senha</b></label>
				  <input class="w3-input w3-border" type="password" placeholder="Digite sua senha" name="senha" required/>
				  <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit" name="bOK" value="Entrar" >Acessar</button>
				  
				  
				</div>
			  </form>

			  <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">				
				<!-- FORM ALTERAR SENHA -->
				<form method="post" action="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/alterarSenha.jsp">
					<button class="w3-button w3-block w3-gray w3-section w3-padding" type="submit" name="bOK" value="Trocar Senha">Alterar senha</button>
				</form>
				
			  </div>

				<form class="w3-container" method="post" action="mvc?logica=Login">
					<button class="w3-button w3-block w3-gray w3-section w3-padding" type="submit" name="bOFF" value="Sair">Sair</button>
				</form>
			</div>
		  </div>
    	</div>
	
	
	<!-- CODIGO ANTIGO -->
	
	<!-- 
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
	 -->

		
	
</body>
</html>