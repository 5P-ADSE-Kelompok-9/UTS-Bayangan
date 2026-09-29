package com.uts;

import java.math.BigDecimal;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "app.salary")
public class SalaryProperties {

    private int normalHours;
    private BigDecimal hourlyRate;
    private BigDecimal overtimeMultiplier;
    private BigDecimal defaultExpenses;

    public int getNormalHours() {
        return normalHours;
    }

    public void setNormalHours(int normalHours) {
        this.normalHours = normalHours;
    }

    public BigDecimal getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(BigDecimal hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public BigDecimal getOvertimeMultiplier() {
        return overtimeMultiplier;
    }

    public void setOvertimeMultiplier(BigDecimal overtimeMultiplier) {
        this.overtimeMultiplier = overtimeMultiplier;
    }

    public BigDecimal getDefaultExpenses() {
        return defaultExpenses;
    }

    public void setDefaultExpenses(BigDecimal defaultExpenses) {
        this.defaultExpenses = defaultExpenses;
    }
}