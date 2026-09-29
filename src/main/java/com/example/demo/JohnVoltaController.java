package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JohnVoltaController {

	private final JohnTravoltaLogicService johnTravoltaLogicService;

	public JohnVoltaController(JohnTravoltaLogicService johnTravoltaLogicService) {
		this.johnTravoltaLogicService = johnTravoltaLogicService;
	}

	@GetMapping({"/", "/john-volta"})
	public ModelAndView showJohnVoltaPage() {
		return new ModelAndView("john-volta");
	}

	@PostMapping("/john-volta")
	public ModelAndView processJohnTravoltaInput(@RequestParam("inputName") String inputName) {
		ModelAndView modelAndView = new ModelAndView("john-volta");
		modelAndView.addObject("inputName", inputName);
		modelAndView.addObject("resultMessage", johnTravoltaLogicService.evaluate(inputName));
		return modelAndView;
	}
}
