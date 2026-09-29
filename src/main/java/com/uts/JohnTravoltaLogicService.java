package com.uts;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.stereotype.Service;

@Service
public class JohnTravoltaLogicService {

    private static final int MONEY_SCALE = 2;

    private final SalaryProperties salaryProperties;

    public JohnTravoltaLogicService(SalaryProperties salaryProperties) {
        this.salaryProperties = salaryProperties;
    }

    public SalaryResult calculate(
            String employeeName,
            Integer hoursWorked,
            BigDecimal expenses
    ) {
        validateInput(employeeName, hoursWorked, expenses);

        int normalHours = Math.min(
                hoursWorked,
                salaryProperties.getNormalHours()
        );

        int overtimeHours = Math.max(
                hoursWorked - salaryProperties.getNormalHours(),
                0
        );

        BigDecimal hourlyRate = money(
                salaryProperties.getHourlyRate()
        );

        BigDecimal overtimeMultiplier =
                salaryProperties.getOvertimeMultiplier();

        BigDecimal normalSalary = money(
                hourlyRate.multiply(
                        BigDecimal.valueOf(normalHours)
                )
        );

        BigDecimal overtimeSalary = money(
                hourlyRate
                        .multiply(overtimeMultiplier)
                        .multiply(BigDecimal.valueOf(overtimeHours))
        );

        BigDecimal totalSalary = money(
                normalSalary.add(overtimeSalary)
        );

        BigDecimal totalExpenses = money(expenses);

        BigDecimal savings = money(
                totalSalary.subtract(totalExpenses)
        );

        boolean canSave = savings.compareTo(BigDecimal.ZERO) > 0;

        return new SalaryResult(
                employeeName.trim(),
                hoursWorked,
                normalHours,
                overtimeHours,
                hourlyRate,
                overtimeMultiplier,
                normalSalary,
                overtimeSalary,
                totalSalary,
                totalExpenses,
                savings,
                canSave
        );
    }

    private void validateInput(
            String employeeName,
            Integer hoursWorked,
            BigDecimal expenses
    ) {
        if (employeeName == null || employeeName.trim().isEmpty()) {
            throw new IllegalArgumentException(
                    "Employee name is required."
            );
        }

        if (hoursWorked == null || hoursWorked < 0) {
            throw new IllegalArgumentException(
                    "Hours worked must be zero or greater."
            );
        }

        if (expenses == null || expenses.compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException(
                    "Expenses cannot be negative."
            );
        }
    }

    private BigDecimal money(BigDecimal value) {
        return value.setScale(
                MONEY_SCALE,
                RoundingMode.HALF_UP
        );
    }
}