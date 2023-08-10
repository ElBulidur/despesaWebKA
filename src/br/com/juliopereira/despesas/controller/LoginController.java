package br.com.juliopereira.despesas.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.juliopereira.despesas.dao.JdbcDespesaDao;
import br.com.juliopereira.despesas.dao.JdbcUsuarioDao;
import br.com.juliopereira.despesas.modelo.Despesa;
import br.com.juliopereira.despesas.modelo.Usuario;

@Controller
public class LoginController {

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "formulario-login";
	}
	
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, Model model) {
		

		if(new JdbcUsuarioDao().existeUsuario(usuario)) {
			model.addAttribute("usuarioLogado", usuario);
			
			JdbcDespesaDao dao = new JdbcDespesaDao();
			List<Despesa> despesas = dao.lista();
			model.addAttribute("despesas", despesas);
			
			return "despesa/lista";
		}
		
		return "formulario-login";
	}
}
