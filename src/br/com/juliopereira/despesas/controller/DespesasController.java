package br.com.juliopereira.despesas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.juliopereira.despesas.dao.JdbcDespesaDao;
import br.com.juliopereira.despesas.modelo.Despesa;

@Controller
public class DespesasController {

	@RequestMapping("/novaDespesa")
	public String form() {
		return "despesa/formulario";
	}
	
	@RequestMapping("/adicionaDespesa")
	public String adiciona(Despesa despesa) {
		
		JdbcDespesaDao dao = new JdbcDespesaDao();
		
		dao.adiciona(despesa); //POJO
		
		return "redirect:listaDespesas";
	}
	
	@RequestMapping("/removeDespesa")
	public String remove(Despesa despesa) {
		
		JdbcDespesaDao dao = new JdbcDespesaDao();
		
		dao.remove(despesa); //POJO
		
		return "redirect:listaDespesas";
	}
	
	@RequestMapping("/mostraDespesa")
	public String mostra(Long id, Model model) {
		
		JdbcDespesaDao dao = new JdbcDespesaDao();
		
		Despesa despesa = dao.buscaPorId(id);

		model.addAttribute("despesa", despesa);
		
		return "despesa/mostra";
	}

	@RequestMapping("/alteraDespesa")
	public String altera(Despesa despesa) {
		
		JdbcDespesaDao dao = new JdbcDespesaDao();
		
		dao.altera(despesa);
		
		return "redirect:listaDespesas";
		//return "forward:listaDespesas";
	}
	
	//@ResponseBody //resposta com textos
	@RequestMapping("quitarDespesa")
	public String quitarDespesa(Long id, Model model) {
		JdbcDespesaDao dao = new JdbcDespesaDao();
		
		dao.quita(id);
		
		model.addAttribute("despesa", dao.buscaPorId(id));
		
		return "despesa/quitada";
	}
	
	
	
}
