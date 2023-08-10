package br.com.juliopereira.despesas.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.juliopereira.despesas.dao.JdbcDespesaDao;
import br.com.juliopereira.despesas.modelo.Despesa;

@Controller
public class ListaDespesas {

	@RequestMapping("/listaDespesas")
	public String lista(Model model) {
		JdbcDespesaDao dao = new JdbcDespesaDao();
		List<Despesa> despesas = dao.lista();
		model.addAttribute("despesas", despesas);
		
		return "despesa/lista";
	}
}
