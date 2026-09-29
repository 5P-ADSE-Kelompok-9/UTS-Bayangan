package com.uts;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuadraticEquationController {

    private final QuadraticEquationService quadraticEquationService;

    public QuadraticEquationController(
            QuadraticEquationService quadraticEquationService
    ) {
        this.quadraticEquationService = quadraticEquationService;
    }

    @GetMapping("/persamaan-kuadrat")
    public ModelAndView showPage() {
        return new ModelAndView("persamaan-kuadrat");
    }

    @PostMapping("/persamaan-kuadrat")
    public ModelAndView calculate(
            @RequestParam(required = false) String a,
            @RequestParam(required = false) String b,
            @RequestParam(required = false) String c
    ) {
        ModelAndView modelAndView =
                new ModelAndView("persamaan-kuadrat");

        modelAndView.addObject("a", a);
        modelAndView.addObject("b", b);
        modelAndView.addObject("c", c);

        try {
            double coefficientA = parseNumber(a, "a");
            double coefficientB = parseNumber(b, "b");
            double coefficientC = parseNumber(c, "c");

            QuadraticEquationResult result =
                    quadraticEquationService.calculate(
                            coefficientA,
                            coefficientB,
                            coefficientC
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

    private double parseNumber(
            String value,
            String fieldName
    ) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException(
                    "Koefisien " + fieldName + " wajib diisi."
            );
        }

        try {
            double number = Double.parseDouble(value.trim());

            if (!Double.isFinite(number)) {
                throw new NumberFormatException();
            }

            return number;
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException(
                    "Koefisien " + fieldName
                            + " harus berupa angka yang valid."
            );
        }
    }
}