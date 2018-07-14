<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="proi"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Central de Comunicação</title>
</head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Ações</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	<h1>Cadastro de Ações</h1>
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
	<form method="post" action="mvc?logica=SalvarAtividadeLogica">
		<table border="1">
			<tr>
				<td>Tópico</td>
				<td>Regional</td>
				<td>Subestação</td>
				<td>Alimentador</td>
				<td>Tipo Documento</td>
				<td>Nº Documento</td>
				<td>Ação</td>
				<td>Data Prevista</td>
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
						class="message" name="acao" id="feedback"></textarea></td> <
				<td><input type="date" name="dt_prevista" min="2018-06-01"
					max="2020-12-31"></td>

				<!-- 
				<td><proi:campoData id="dt_prevista" /></td>
				- -->
				<td><input type="submit" name="bOK" value="Salvar" /></td>
			</tr>
		</table>
	</form>
	<h1>Lista de Ações</h1>

	<form method="post" action="mvc?logica=ListaTarefaLogica">
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
		<input type="submit" name="bOK" value="Filtrar" /> <br>
	</form>

	<form method="post" action="mvc?logica=AlteraSituacaoLogica">
		<table border="1">
			<tr>
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

</body>
</html>