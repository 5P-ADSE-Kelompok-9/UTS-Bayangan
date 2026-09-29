package com.uts;

import java.math.BigDecimal;

public record SalaryResult(
        String employeeName,
        int hoursWorked,
        int normalHours,
        int overtimeHours,
        BigDecimal hourlyRate,
        BigDecimal overtimeMultiplier,
        BigDecimal normalSalary,
        BigDecimal overtimeSalary,
        BigDecimal totalSalary,
        BigDecimal expenses,
        BigDecimal savings,
        boolean canSave
) {
}