package br.com.juliopereira.despesas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OlaMundoController {
	@RequestMapping("/olamundospring")
	public String execute() {
		System.out.println("Executando um serviço com spring MVC!");
		return "ok";
	}
}
