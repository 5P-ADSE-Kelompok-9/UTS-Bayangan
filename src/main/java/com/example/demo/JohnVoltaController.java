package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JohnVoltaController {

	@GetMapping({"/", "/john-volta"})
	public String showJohnVoltaPage() {
		return "john-volta";
	}
}
