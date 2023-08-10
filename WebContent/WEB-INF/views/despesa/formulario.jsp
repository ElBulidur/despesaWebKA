<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Despesas</title>
</head>
<body>

<h2>Adiciona despesas</h2>
<br />
<br />
<form action="adicionaDespesa" method="post">
	Descrição:<br>
	<textarea rows="5" cols="100" name="descricao"></textarea>
	<br />
	<input type="submit" value="Adicionar">
</form>

</body>
</html>