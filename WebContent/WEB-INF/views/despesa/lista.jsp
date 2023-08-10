<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.7.0.min.js"
  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
  crossorigin="anonymous"></script>
  
<title>Listando as despesas</title>
</head>
<body>
<div class="container-fluid">
<div class="row">
<nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Despesas</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <form class="d-flex" role="search" action="novaDespesa" method="post">
                <button class="btn btn-outline-success" type="submit">
                  Adicionar
                </button>
              </form>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</div>

<div class="row">
<div class="col col-md-3"></div>
    <div class="col col-md-6">
		<table cellpadding="2" cellspacing="2"  class="table table-dark table-striped">
			<tr>
				<th>##</th>
				<th>Descrição</th>
				<th>Pago?</th>
				<th>Data Pagamento</th>
				<th>Remover</th>
				<th>Alterar</th>
			</tr>
			<c:forEach var="despesa" items="${despesas}" varStatus="In">
				<tr id="despesa_${despesa.id }" bgcolor="#${In.count % 2 == 0 ? '9c9c9c' : 'f2f2f2'}">
					<td>${despesa.id}</td>
					<td>${despesa.descricao}</td>
					<c:if test="${despesa.pago eq false}">
						<td><a href="#" onClick="quitarAgora(${despesa.id})"> Pagar</a></td>
					</c:if>
					<c:if test="${despesa.pago eq true}">
						<td>Pago</td>
					</c:if>
					
					<td>
						<fmt:formatDate value="${despesa.dataPagamento.time}" pattern="dd/MM/yyyy" />
					</td>
					<td><a href="removeDespesa?id=${despesa.id}" >Remover</a></td>
					<td><a href="mostraDespesa?id=${despesa.id}" >Alterar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<div class="col col-md-3"></div>
</div>
</div>

	<script type="text/javascript">
	function quitarAgora(id){
		//alert("oioi");
		$.get("quitarDespesa?id="+id, (resposta)=>{
			$("#despesa_"+id).html(resposta)
		});
	}
	</script>
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>