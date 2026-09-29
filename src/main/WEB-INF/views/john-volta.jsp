<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Perhitungan Gaji John Travolta</title>

    <style>
        body {
            margin: 0;
            padding: 24px;
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            color: #1f2937;
        }

        .container {
            max-width: 850px;
            margin: auto;
            padding: 28px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
        }

        h1 {
            margin-top: 0;
            color: #1d4ed8;
        }

        .description {
            color: #4b5563;
        }
        .navigation {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-bottom: 24px;
    flex-wrap: wrap;
}

.navigation a {
    padding: 10px 16px;
    border-radius: 8px;
    background: #2563eb;
    color: white;
    text-decoration: none;
    font-weight: bold;
}

.navigation a:hover {
    background: #1d4ed8;
}

        form {
            margin-top: 24px;
            padding: 20px;
            background: #f8fafc;
            border: 1px solid #d1d5db;
            border-radius: 8px;
        }

        label {
            display: block;
            margin-top: 14px;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input {
            width: 100%;
            max-width: 420px;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #9ca3af;
            border-radius: 6px;
        }

        button {
            margin-top: 20px;
            padding: 11px 18px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background: #1d4ed8;
        }

        .error {
            margin-top: 20px;
            padding: 14px;
            border-left: 4px solid #dc2626;
            background: #fee2e2;
            color: #991b1b;
        }

        .result {
            margin-top: 24px;
            padding: 20px;
            border-left: 4px solid #16a34a;
            background: #f0fdf4;
        }

        table {
            width: 100%;
            margin-top: 12px;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
            border-bottom: 1px solid #d1d5db;
            text-align: left;
        }

        th {
            width: 55%;
            background: #f9fafb;
        }

        .saving {
            color: #15803d;
            font-weight: bold;
        }

        .not-saving {
            color: #b91c1c;
            font-weight: bold;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Perhitungan Gaji Mingguan</h1>

    <p class="description">
        Aplikasi ini menghitung gaji normal, gaji lembur, total pemasukan,
        dan tabungan John Travolta.
    </p>

    <p class="description">
        Jam kerja normal:
        <strong>${salaryProperties.normalHours} jam</strong>
    </p>
    <nav class="navigation">
    <a href="${pageContext.request.contextPath}/john-volta">
        Kalkulator Gaji
    </a>

    <a href="${pageContext.request.contextPath}/persamaan-kuadrat">
        Persamaan Kuadrat
    </a>
</nav>
    <form action="${pageContext.request.contextPath}/john-volta"
          method="post">

        <label for="employeeName">
            Nama karyawan
        </label>

        <input
                id="employeeName"
                name="employeeName"
                type="text"
                value="<c:out value='${employeeName}'/>"
                placeholder="Contoh: John Travolta"
                required
        />

        <label for="hoursWorked">
            Jumlah jam kerja per minggu
        </label>

        <input
                id="hoursWorked"
                name="hoursWorked"
                type="number"
                min="0"
                value="<c:out value='${hoursWorked}'/>"
                placeholder="Contoh: 52"
                required
        />

        <label for="expenses">
            Pengeluaran per minggu
        </label>

        <input
                id="expenses"
                name="expenses"
                type="number"
                min="0"
                step="1000"
                value="<c:out value='${expenses}'/>"
                placeholder="Contoh: 600000"
                required
        />

        <button type="submit">
            Hitung Gaji
        </button>
    </form>

    <c:if test="${not empty errorMessage}">
        <div class="error">
            <strong>Terjadi kesalahan:</strong>
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>

    <c:if test="${not empty result}">
        <div class="result">
            <h2>Hasil Perhitungan</h2>

            <table>
                <tr>
                    <th>Nama karyawan</th>
                    <td><c:out value="${result.employeeName}"/></td>
                </tr>

                <tr>
                    <th>Total jam kerja</th>
                    <td>
                        <fmt:formatNumber value="${result.hoursWorked}"/>
                        jam
                    </td>
                </tr>

                <tr>
                    <th>Jam normal</th>
                    <td>
                        <fmt:formatNumber value="${result.normalHours}"/>
                        jam
                    </td>
                </tr>

                <tr>
                    <th>Jam lembur</th>
                    <td>
                        <fmt:formatNumber value="${result.overtimeHours}"/>
                        jam
                    </td>
                </tr>

                <tr>
                    <th>Upah per jam</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.hourlyRate}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Gaji normal</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.normalSalary}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Gaji lembur</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.overtimeSalary}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Total pemasukan</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.totalSalary}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Total pengeluaran</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.expenses}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>

                <tr>
                    <th>Status</th>
                    <td>
                        <c:choose>
                            <c:when test="${result.canSave}">
                                <span class="saving">
                                    Bisa menabung
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="not-saving">
                                    Tidak bisa menabung
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>

                <tr>
                    <th>Jumlah tabungan/sisa uang</th>
                    <td>
                        Rp
                        <fmt:formatNumber
                                value="${result.savings}"
                                type="number"
                                groupingUsed="true"
                                maxFractionDigits="0"
                        />
                    </td>
                </tr>
            </table>
        </div>
    </c:if>
</div>
</body>
</html>