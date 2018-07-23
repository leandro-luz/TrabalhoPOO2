<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Central Comunicação</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-green w3-card w3-left-align w3-large">
    <a href="index.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Home</a>
    <a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/login.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
    <a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/novoUsuario.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Cadastro</a>
  
  
 			 <c:if
				test="${sessionScope.usuarioLogado.perfil != null && sessionScope.usuarioLogado.perfil < 3}">
				<a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Atividades</a>
				<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Resumo</a>
				<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Olá ${sessionScope.usuarioLogado.nome}</a>
			</c:if>
			<c:if
				test="${sessionScope.usuarioLogado.perfil != null && sessionScope.usuarioLogado.perfil == 3}">
				<a href="mvc?logica=IniciaTarefaLogica&url=/WEB-INF/jsp/tarefa.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Atividades</a>
				<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Resumo</a>
				<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right w3-tiny">Olá ${sessionScope.usuarioLogado.nome}</a>
			</c:if>
  
  </div>

<!-- CODIGO ANTIGO 

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
-->
</html>