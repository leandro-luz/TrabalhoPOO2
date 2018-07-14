<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Central de Comunicação</title>
</head>
<body>

	<table cellspacing="10">
		<tr>
			<td><a href="index.jsp"> <img src="img/logo.png" width="230"
					height="100" alt="war room" align="top">
			</a></td>
			<td><a href="index.jsp">Inicio</a></td>
			<td></td>
			<td></td>
			<td><a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/login.jsp"> Login</a></td>
			<td></td>
			<td></td>
			<td><a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/novoUsuario.jsp">
					Cadastro</a></td>

			<c:if
				test="${sessionScope.usuarioLogado.perfil != null && sessionScope.usuarioLogado.perfil < 3}">
				<td></td>
				<td></td>
				<td><a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp">
						Atividades</a></td>
				<td></td>
				<td></td>
				<td><a href="#"> Resumo</a></td>
				<td></td>
				<td></td>
				<td><a href="#"> Olá-- ${sessionScope.usuarioLogado.nome}</a></td>
			</c:if>

			<c:if
				test="${sessionScope.usuarioLogado.perfil != null && sessionScope.usuarioLogado.perfil == 3}">
				<td></td>
				<td></td>
				<td><a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp">
						Atividades</a></td>
				<td></td>
				<td></td>
				<td><a href="#"> Resumo</a></td>
				<td></td>
				<td></td>
				<td><a href="#"> Administração</a></td>
				<td></td>
				<td></td>
				<td><a href="#"> Olá-- ${sessionScope.usuarioLogado.nome}</a></td>
			</c:if>


		</tr>
	</table>
</html>