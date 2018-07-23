<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<style>
	div.ex1 {
	    overflow-y: scroll;
	    position: inherit;
	}
</style>

</head>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cadastro de Ações</title>
	<link href="css/layout.css" rel="stylesheet" type="text/css" />
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
	
<div class="w3-container">
	<form method="post" action="mvc?logica=SalvarAtividadeLogica">
		<table class="w3-table-all w3-hoverable w3-small">
		<h3>Cadastro de Ações</h3>
			<tr class="w3-light-green">
				<td>Tópico</td>
				<td>Regional</td>
				<td>Subestação</td>
				<td>Alimentador</td>
				<td>Tipo Documento</td>
				<td>Nº Documento</td>
				<td>Ação</td>
				<td>Data Prevista</td>
				<td></td>
			</tr>
			<tr>
				<td><select name="topico">
						<c:forEach var="topicos" items="${topicos}">
							<option value="${topicos}" selected>${topicos}</option>
						</c:forEach>
				</select></td>

				<c:if test="${sessionScope.usuarioLogado.perfil != 1}">
					<td><select name="regional">
							<c:forEach var="regionais" items="${regionais}">
								<option value="${regionais}" selected>${regionais}</option>
							</c:forEach>
					</select></td>
				</c:if>
				<c:if test="${sessionScope.usuarioLogado.perfil == 1}">
					<td><select name="regional">
							<option value="${sessionScope.usuarioLogado.regional}">${sessionScope.usuarioLogado.regional}</option>
					</select></td>
				</c:if>
				<td><input type="number" name="subestacao" min="1"></td>
				<td><input type="number" name="alimentador" min="1"></td>
				<td><select name="tipoDocumento">
						<c:forEach var="documentos" items="${documentos}">
							<option value="${documentos}" selected>${documentos}</option>
						</c:forEach>
				</select></td>
				<td><input type="number" name="nDocumento" min="1"></td>
				<td><textarea placeholder="Máximo 200 caracteres!"
						class="message" name="acao" id="feedback"></textarea></td> <td><input type="date" name="dt_prevista" min="2018-06-01"
					max="2020-12-31"></td>

				<!-- 
				<td><proi:campoData id="dt_prevista" /></td>
				- -->
				<td><input class="w3-btn w3-blue-grey" type="submit" name="bOK" value="Salvar" /></td>
			</tr>
			<tr></tr>
		</table>
	</form>
</div>
	
	
<div class="w3-container">
	<form method="post" action="mvc?logica=ListaTarefaLogica">
	<h2>Lista de Ações</h2>
		Regional:
		<c:if test="${sessionScope.usuarioLogado.perfil != 1}">
			<td><select name="regional">
					<c:forEach var="regionais" items="${regionais}">
						<option value="${regionais}">${regionais}</option>
					</c:forEach>
			</select></td>
		</c:if>
		<c:if test="${sessionScope.usuarioLogado.perfil == 1}">
			<td><select name="regional">
					<option value="${sessionScope.usuarioLogado.regional}">${sessionScope.usuarioLogado.regional}</option>
			</select></td>
		</c:if>
		<input class="w3-btn w3-blue-grey" type="submit" name="bOK" value="Filtrar" /> <br>
	</form>
<div class="ex1" >
	<form method="post" action="mvc?logica=AlteraSituacaoLogica">
		<table class="w3-table-all w3-hoverable w3-tiny ">
			<tr class="w3-light-green">
				<td>Id</td>
				<td>Tópico</td>
				<td>Regional</td>
				<td>Subestação</td>
				<td>Alimentador</td>
				<td>Tipo Documento</td>
				<td>Nº Documento</td>
				<td>Ação</td>
				<td>Data Registrado</td>
				<td>Registrado por</td>
				<td>Data Previsão</td>
				<td>Situação</td>
				<td>Status</td>
				<td>Data Atualização</td>
				<td>Atualizado por</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>


			<c:forEach var="tarefas" items="${tarefas}">
				<tr>
					<td>${tarefas.id}</td>
					<td>${tarefas.topico}</td>
					<td>${tarefas.regional}</td>
					<td>${tarefas.subestacao}</td>
					<td>${tarefas.alimentador}</td>
					<td>${tarefas.tipoDocumento}</td>
					<td>${tarefas.nDocumento}</td>
					<td>${tarefas.acao}</td>
					<td>${tarefas.dt_registro}</td>
					<td>${tarefas.matricula}</td>
					<td>${tarefas.dt_prevista}</td>
					<td>${tarefas.situacao}</td>
					<td>${tarefas.status}</td>
					<td>${tarefas.dt_conclusao}</td>
					<td>${tarefas.alterado}</td>
					<c:choose>
						<c:when test="${tarefas.situacao == 'Em analise'}">
							<c:if test="${sessionScope.usuarioLogado.perfil == 1}">
								<td><a
									href="mvc?logica=AlteraSituacaoLogica&acao=Excluida&id=${tarefas.id}">Excluir</a></td>
							</c:if>
							<c:if test="${sessionScope.usuarioLogado.perfil != 1}">
								<td><a
									href="mvc?logica=AlteraSituacaoLogica&acao=Excluida&id=${tarefas.id}">Excluir</a></td>
								<td><a
									href="mvc?logica=AlteraSituacaoLogica&acao=Aprovada&id=${tarefas.id}">Aprovar</a></td>
								<td><a
									href="mvc?logica=AlteraSituacaoLogica&acao=Reprovada&id=${tarefas.id}">Reprovar</a></td>
							</c:if>
						</c:when>

						<c:when test="${tarefas.status == 'Aprovada'}">
							<td><a
								href="mvc?logica=AlteraSituacaoLogica&acao=Concluida&id=${tarefas.id}">Concluir</a></td>
						</c:when>

						<c:otherwise>
						</c:otherwise>

					</c:choose>
				</tr>
			</c:forEach>
		</table>
	</form>
</div>	
</div>

</body>
</html>