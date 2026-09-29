<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<fmt:setLocale value="en_US"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Weekly Salary Calculator</title>

    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --background: #f1f5f9;
            --card: #ffffff;
            --border: #e2e8f0;
            --text: #1e293b;
            --muted: #64748b;
            --success: #15803d;
            --success-bg: #f0fdf4;
            --danger: #b91c1c;
            --danger-bg: #fef2f2;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 32px 16px;
            background: var(--background);
            color: var(--text);
            font-family: Arial, Helvetica, sans-serif;
        }

        .container {
            width: 100%;
            max-width: 920px;
            margin: 0 auto;
        }

        .header {
            margin-bottom: 24px;
            text-align: center;
        }

        .header h1 {
            margin: 0 0 8px;
            color: var(--primary-dark);
            font-size: 32px;
        }

        .header p {
            margin: 0;
            color: var(--muted);
        }

        .card {
            margin-bottom: 24px;
            padding: 24px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06);
        }

        .card h2 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 21px;
        }

        .configuration {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 22px;
        }

        .configuration-item {
            padding: 14px;
            background: #f8fafc;
            border: 1px solid var(--border);
            border-radius: 10px;
        }

        .configuration-label {
            display: block;
            margin-bottom: 6px;
            color: var(--muted);
            font-size: 13px;
        }

        .configuration-value {
            font-weight: bold;
            font-size: 17px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            color: var(--text);
            font-size: 15px;
            outline: none;
        }

        input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.14);
        }

        .hint {
            margin-top: 6px;
            color: var(--muted);
            font-size: 12px;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 13px 18px;
            border: none;
            border-radius: 8px;
            background: var(--primary);
            color: white;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: var(--primary-dark);
        }

        .alert {
            margin-bottom: 24px;
            padding: 15px 17px;
            border-radius: 9px;
            font-weight: bold;
        }

        .alert-error {
            border: 1px solid #fecaca;
            background: var(--danger-bg);
            color: var(--danger);
        }

        .result-card {
            border-top: 5px solid var(--success);
        }

        .result-card h2 {
            color: var(--success);
        }

        .summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 22px;
        }

        .summary-item {
            padding: 16px;
            background: var(--success-bg);
            border: 1px solid #bbf7d0;
            border-radius: 10px;
        }

        .summary-label {
            display: block;
            margin-bottom: 7px;
            color: #166534;
            font-size: 13px;
        }

        .summary-value {
            color: #14532d;
            font-size: 21px;
            font-weight: bold;
        }

        .result-table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border: 1px solid var(--border);
            border-radius: 8px;
        }

        .result-table th,
        .result-table td {
            padding: 13px 15px;
            border-bottom: 1px solid var(--border);
            text-align: left;
        }

        .result-table tr:last-child th,
        .result-table tr:last-child td {
            border-bottom: none;
        }

        .result-table th {
            width: 55%;
            background: #f8fafc;
            color: #475569;
            font-weight: 600;
        }

        .result-table td {
            text-align: right;
            font-weight: 600;
        }

        .status-save {
            color: var(--success);
        }

        .status-no-save {
            color: var(--danger);
        }

        @media (max-width: 700px) {
            body {
                padding: 20px 12px;
            }

            .card {
                padding: 18px;
            }

            .configuration,
            .summary,
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full-width {
                grid-column: auto;
            }

            .header h1 {
                font-size: 26px;
            }

            .result-table th,
            .result-table td {
                padding: 11px;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <header class="header">
        <h1>Weekly Salary Calculator</h1>
        <p>Calculate regular pay, overtime pay, expenses, and savings.</p>
    </header>

    <section class="card">
        <h2>Salary Configuration</h2>

        <div class="configuration">
            <div class="configuration-item">
                <span class="configuration-label">
                    Normal working hours
                </span>

                <span class="configuration-value">
                    <fmt:formatNumber
                            value="${salaryProperties.normalHours}"
                            maxFractionDigits="0"
                    />
                    hours
                </span>
            </div>

            <div class="configuration-item">
                <span class="configuration-label">
                    Hourly rate
                </span>

                <span class="configuration-value">
                    <fmt:formatNumber
                            value="${salaryProperties.hourlyRate}"
                            type="currency"
                            currencyCode="USD"
                            maxFractionDigits="2"
                    />
                </span>
            </div>

            <div class="configuration-item">
                <span class="configuration-label">
                    Overtime multiplier
                </span>

                <span class="configuration-value">
                    ${salaryProperties.overtimeMultiplier}x
                </span>
            </div>
        </div>

        <form
                action="${pageContext.request.contextPath}/john-volta"
                method="post"
        >
            <div class="form-grid">
                <div class="form-group full-width">
                    <label for="employeeName">
                        Employee name
                    </label>

                    <input
                            id="employeeName"
                            name="employeeName"
                            type="text"
                            value="${fn:escapeXml(employeeName)}"
                            placeholder="Example: John Travolta"
                            required
                    />
                </div>

                <div class="form-group">
                    <label for="hoursWorked">
                        Hours worked per week
                    </label>

                    <input
                            id="hoursWorked"
                            name="hoursWorked"
                            type="number"
                            min="0"
                            step="1"
                            value="${hoursWorked}"
                            placeholder="Example: 52"
                            required
                    />

                    <span class="hint">
                        Overtime starts after
                        ${salaryProperties.normalHours} hours.
                    </span>
                </div>

                <div class="form-group">
                    <label for="expenses">
                        Weekly expenses
                    </label>

                    <input
                            id="expenses"
                            name="expenses"
                            type="number"
                            min="0"
                            step="0.01"
                            value="${expenses}"
                            placeholder="Example: 600.00"
                            required
                    />

                    <span class="hint">
                        Enter the amount in USD.
                    </span>
                </div>
            </div>

            <button type="submit">
                Calculate Salary
            </button>
        </form>
    </section>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>

    <c:if test="${not empty result}">
        <section class="card result-card">
            <h2>Calculation Result</h2>

            <div class="summary">
                <div class="summary-item">
                    <span class="summary-label">
                        Total salary
                    </span>

                    <span class="summary-value">
                        <fmt:formatNumber
                                value="${result.totalSalary}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </span>
                </div>

                <div class="summary-item">
                    <span class="summary-label">
                        Weekly expenses
                    </span>

                    <span class="summary-value">
                        <fmt:formatNumber
                                value="${result.expenses}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </span>
                </div>

                <div class="summary-item">
                    <span class="summary-label">
                        Savings
                    </span>

                    <span class="summary-value">
                        <fmt:formatNumber
                                value="${result.savings}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </span>
                </div>
            </div>

            <table class="result-table">
                <tr>
                    <th>Employee name</th>
                    <td>
                        <c:out value="${result.employeeName}"/>
                    </td>
                </tr>

                <tr>
                    <th>Total hours worked</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.hoursWorked}"
                                maxFractionDigits="0"
                        />
                        hours
                    </td>
                </tr>

                <tr>
                    <th>Regular hours</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.normalHours}"
                                maxFractionDigits="0"
                        />
                        hours
                    </td>
                </tr>

                <tr>
                    <th>Overtime hours</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.overtimeHours}"
                                maxFractionDigits="0"
                        />
                        hours
                    </td>
                </tr>

                <tr>
                    <th>Hourly rate</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.hourlyRate}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Regular salary</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.normalSalary}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Overtime salary</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.overtimeSalary}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Total income</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.totalSalary}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Weekly expenses</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.expenses}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Saving status</th>
                    <td>
                        <c:choose>
                            <c:when test="${result.canSave}">
                                <span class="status-save">
                                    Can save money
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="status-no-save">
                                    Cannot save money
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>

                <tr>
                    <th>Remaining balance</th>
                    <td>
                        <fmt:formatNumber
                                value="${result.savings}"
                                type="currency"
                                currencyCode="USD"
                                maxFractionDigits="2"
                        />
                    </td>
                </tr>
            </table>
        </section>
    </c:if>
</div>
</body>
</html>