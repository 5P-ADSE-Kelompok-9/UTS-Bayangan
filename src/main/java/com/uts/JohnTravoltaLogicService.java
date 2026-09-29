package com.uts;

import java.math.BigDecimal;
import java.math.RoundingMode;

import org.springframework.stereotype.Service;

@Service
public class JohnTravoltaLogicService {

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

        BigDecimal normalSalary = salaryProperties
                .getHourlyRate()
                .multiply(BigDecimal.valueOf(normalHours));

        BigDecimal overtimeSalary = salaryProperties
                .getHourlyRate()
                .multiply(salaryProperties.getOvertimeMultiplier())
                .multiply(BigDecimal.valueOf(overtimeHours));

        BigDecimal totalSalary = normalSalary
                .add(overtimeSalary)
                .setScale(0, RoundingMode.HALF_UP);

        BigDecimal savings = totalSalary
                .subtract(expenses)
                .setScale(0, RoundingMode.HALF_UP);

        boolean canSave = savings.compareTo(BigDecimal.ZERO) > 0;

        return new SalaryResult(
                employeeName.trim(),
                hoursWorked,
                normalHours,
                overtimeHours,
                salaryProperties.getHourlyRate(),
                salaryProperties.getOvertimeMultiplier(),
                normalSalary,
                overtimeSalary,
                totalSalary,
                expenses,
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
            throw new IllegalArgumentException("Nama karyawan wajib diisi.");
        }

        if (hoursWorked == null || hoursWorked < 0) {
            throw new IllegalArgumentException(
                    "Jam kerja harus berupa angka minimal 0."
            );
        }

        if (expenses == null || expenses.compareTo(BigDecimal.ZERO) < 0) {
            throw new IllegalArgumentException(
                    "Pengeluaran tidak boleh bernilai negatif."
            );
        }
    }
}