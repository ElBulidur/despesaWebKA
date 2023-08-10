<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mostrando a despesa</title>
</head>
<body>
<h3>Alterar despesa ${despesa.id}</h3>

<form action="alteraDespesa" method="post">
	<input type="hidden" name="id" value="${despesa.id }" />
	Descrição:<br>
	<textarea rows="5" cols="100" name="descricao">${despesa.descricao }</textarea>
	  <br />
	<input type="checkbox" name="pago" value="true" />
	 <br />
	<input type="text" name="dataPagamento" 
	value="<fmt:formatDate value="${despesa.dataPagamento.time}" pattern="dd/MM/yyyy"/>" />
	<br />
	<br />
	<input type="submit" value="Alterar"/>
</form>

</body>
</html>