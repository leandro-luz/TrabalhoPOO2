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
<title>Cadastro de Usuário</title>
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
	
	<c:if test="${noticias.existeAvisos}">
		<div id="aviso">
			<ul>
				<c:forEach var="aviso" items="${noticias.avisos}">
					<li>${aviso}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
	<!-- FORMULÁRIO DE CADASTRO -->
		<div class="w3-container w3-padding-16" >
		
		  <div id="id01" class="w3-content">
			<div class="w3-modal-content w3-card-4" style="max-width:600px">
			  <form class="w3-container" method="post" action="mvc?logica=AdicionaUsuarioLogica">
			  <h4>Cadastro de Usuário</h4>
				<div class="w3-section">
				  <label><b>Matrícula</b></label>
				  	<input class="w3-input w3-border w3-margin-bottom" type="number" placeholder="Digite sua matrícula" name="matricula"  required/>
				  <label><b>Nome</b></label>
				  	<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Digite seu nome" name="nome" required/>
				 <label><b>E-mail</b></label>
				  	<input class="w3-input w3-border w3-margin-bottom" type="email" placeholder="Digite seu e-mail" name="email" required/>
				  <label><b>Regional</b></label>
				  	<select class="w3-select"  name="regional">
						<c:forEach var="regionais" items="${regionais}">
							<option value="${regionais}">${regionais}</option>
						</c:forEach>
					</select>
				  <label><b>Senha</b></label>
				  	<input class="w3-input w3-border" type="password" placeholder="Digite sua senha" name="senha" required/>
				  
				  <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit" name="bOK" value="Salvar">Salvar</button>
				  
				</div>
			  </form>
			  <form class="w3-container" method="post" action="mvc?logica=AdicionaUsuarioLogica">
			  	<button class="w3-button w3-block w3-gray w3-section w3-padding" type="submit" name="bOFF" value="Voltar">Voltar</button>
			  </form>
			  		
			</div>
		  </div>
    	</div>
	
	
	<!-- CODIGO ANTIGO -->
	<!-- 
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
	 -->
	
</body>
</html>