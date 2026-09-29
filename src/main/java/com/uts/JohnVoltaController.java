package com.uts;

import java.math.BigDecimal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JohnVoltaController {

    private final JohnTravoltaLogicService salaryService;
    private final SalaryProperties salaryProperties;

    public JohnVoltaController(
            JohnTravoltaLogicService salaryService,
            SalaryProperties salaryProperties
    ) {
        this.salaryService = salaryService;
        this.salaryProperties = salaryProperties;
    }

    @GetMapping({"/", "/john-volta"})
    public ModelAndView showPage() {
        ModelAndView modelAndView = new ModelAndView("john-volta");

        modelAndView.addObject(
                "defaultExpenses",
                salaryProperties.getDefaultExpenses()
        );

        return modelAndView;
    }

    @PostMapping("/john-volta")
    public ModelAndView calculateSalary(
            @RequestParam(required = false) String employeeName,
            @RequestParam(required = false) Integer hoursWorked,
            @RequestParam(required = false) BigDecimal expenses
    ) {
        ModelAndView modelAndView = new ModelAndView("john-volta");

        modelAndView.addObject("employeeName", employeeName);
        modelAndView.addObject("hoursWorked", hoursWorked);
		modelAndView.addObject("salaryProperties", salaryProperties);
        modelAndView.addObject(
                "expenses",
                expenses != null
                        ? expenses
                        : salaryProperties.getDefaultExpenses()
        );

        try {
            BigDecimal actualExpenses = expenses != null
                    ? expenses
                    : salaryProperties.getDefaultExpenses();

            SalaryResult result = salaryService.calculate(
                    employeeName,
                    hoursWorked,
                    actualExpenses
            );

            modelAndView.addObject("result", result);
        } catch (IllegalArgumentException exception) {
            modelAndView.addObject(
                    "errorMessage",
                    exception.getMessage()
            );
        }

        return modelAndView;
    }
}