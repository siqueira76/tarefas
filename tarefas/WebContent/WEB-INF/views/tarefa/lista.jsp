<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<body>
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id' : id}, function () {
				//Selecionando o Elemento Html atraves da ID e alterando o Html dele
				$("#tarefa_"+id).html("finalizado");
			});
		}
	</script>
	<a href="novaTarefa">Criar Tarefa</a>
	</br>
	</br>
	<table>
		<tr>
			<th>Id</th>
			<td>Descrição</td>
			<th>Finalizado</th>
			<th>Data de Finalização</th>
		<tr>

			<c:forEach items="${tarefas}" var="tarefa">
				<tr>
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>

					<c:if test="${tarefa.finalizado eq false}">
						<td id="tarefa_${tarefa.id}"><a href="#"
							onclick="finalizaAgora(${tarefa.id})"> Finaliza Agora </a></td>
					</c:if>

					<c:if test="${tarefa.finalizado eq true}">
						<td>Finalizado</td>
					</c:if>

					<td><fmt:formatDate value="${tarefa.dataFinalizacao.time}"
							pattern="dd/MM/yyyy" /></td>
					<td><a href="removeTarefa?id=${tarefa.id}" onclick="">Remover</a></td>
					<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
				</tr>

			</c:forEach>
	</table>
</body>
</body>
</html>