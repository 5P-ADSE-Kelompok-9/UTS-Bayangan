<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Persamaan Kuadrat</title>

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
            --success-background: #f0fdf4;
            --danger: #b91c1c;
            --danger-background: #fef2f2;
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
            max-width: 900px;
            margin: auto;
        }

        .header {
            margin-bottom: 24px;
            text-align: center;
        }

        .header h1 {
            margin: 0 0 8px;
            color: var(--primary-dark);
        }

        .header p {
            margin: 0;
            color: var(--muted);
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
            background: var(--primary);
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navigation a:hover {
            background: var(--primary-dark);
        }

        .card {
            padding: 24px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06);
        }

        .card h2 {
            margin-top: 0;
        }

        .equation {
            margin: 20px 0;
            padding: 18px;
            border-radius: 10px;
            background: #eff6ff;
            color: #1e40af;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 16px;
        }

        input:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 13px;
            border: none;
            border-radius: 8px;
            background: var(--primary);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: var(--primary-dark);
        }

        .error {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #fecaca;
            border-radius: 8px;
            background: var(--danger-background);
            color: var(--danger);
            font-weight: bold;
        }

        .result {
            margin-top: 24px;
            border-top: 5px solid var(--success);
        }

        .result h2 {
            color: var(--success);
        }

        .result-table {
            width: 100%;
            border-collapse: collapse;
        }

        .result-table th,
        .result-table td {
            padding: 13px;
            border-bottom: 1px solid var(--border);
        }

        .result-table th {
            width: 50%;
            background: #f8fafc;
            text-align: left;
            color: #475569;
        }

        .result-table td {
            text-align: right;
            font-weight: bold;
        }

        .root {
            color: var(--success);
            font-size: 18px;
        }

        .complex {
            color: #7c3aed;
            font-size: 18px;
        }

        @media (max-width: 650px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <header class="header">
        <h1>Persamaan Kuadrat</h1>
        <p>
            Hitung akar persamaan ax² + bx + c = 0
        </p>
    </header>

    <nav class="navigation">
        <a href="${pageContext.request.contextPath}/john-volta">
            Kalkulator Gaji
        </a>

        <a href="${pageContext.request.contextPath}/persamaan-kuadrat">
            Persamaan Kuadrat
        </a>
    </nav>

    <main class="card">
        <div class="equation">
            ax² + bx + c = 0
        </div>

        <h2>Input Koefisien</h2>

        <form
                action="${pageContext.request.contextPath}/persamaan-kuadrat"
                method="post"
        >
            <div class="form-grid">
                <div>
                    <label for="a">Nilai a</label>
                    <input
                            id="a"
                            name="a"
                            type="number"
                            step="any"
                            value="<c:out value='${a}'/>"
                            placeholder="Contoh: 1"
                            required
                    />
                </div>

                <div>
                    <label for="b">Nilai b</label>
                    <input
                            id="b"
                            name="b"
                            type="number"
                            step="any"
                            value="<c:out value='${b}'/>"
                            placeholder="Contoh: -5"
                            required
                    />
                </div>

                <div>
                    <label for="c">Nilai c</label>
                    <input
                            id="c"
                            name="c"
                            type="number"
                            step="any"
                            value="<c:out value='${c}'/>"
                            placeholder="Contoh: 6"
                            required
                    />
                </div>
            </div>

            <button type="submit">
                Hitung Akar Persamaan
            </button>
        </form>

        <c:if test="${not empty errorMessage}">
            <div class="error">
                <c:out value="${errorMessage}"/>
            </div>
        </c:if>

        <c:if test="${not empty result}">
            <section class="card result">
                <h2>Hasil Perhitungan</h2>

                <table class="result-table">
                    <tr>
                        <th>Persamaan</th>
                        <td>
                            <c:out value="${result.a}"/>x² +
                            <c:out value="${result.b}"/>x +
                            <c:out value="${result.c}"/> = 0
                        </td>
                    </tr>

                    <tr>
                        <th>Diskriminan</th>
                        <td>
                            <fmt:formatNumber
                                    value="${result.discriminant}"
                                    maxFractionDigits="6"
                            />
                        </td>
                    </tr>

                    <c:choose>
                        <c:when test="${result.solutionType == 'TWO_REAL_ROOTS'}">
                            <tr>
                                <th>Jenis solusi</th>
                                <td>
                                    Dua akar real berbeda
                                </td>
                            </tr>

                            <tr>
                                <th>Akar pertama</th>
                                <td class="root">
                                    <fmt:formatNumber
                                            value="${result.rootOne}"
                                            maxFractionDigits="6"
                                    />
                                </td>
                            </tr>

                            <tr>
                                <th>Akar kedua</th>
                                <td class="root">
                                    <fmt:formatNumber
                                            value="${result.rootTwo}"
                                            maxFractionDigits="6"
                                    />
                                </td>
                            </tr>
                        </c:when>

                        <c:when test="${result.solutionType == 'ONE_DOUBLE_ROOT'}">
                            <tr>
                                <th>Jenis solusi</th>
                                <td>
                                    Satu akar real kembar
                                </td>
                            </tr>

                            <tr>
                                <th>Akar kembar</th>
                                <td class="root">
                                    <fmt:formatNumber
                                            value="${result.rootOne}"
                                            maxFractionDigits="6"
                                    />
                                </td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                            <tr>
                                <th>Jenis solusi</th>
                                <td>
                                    Dua akar kompleks
                                </td>
                            </tr>

                            <tr>
                                <th>Akar pertama</th>
                                <td class="complex">
                                    <fmt:formatNumber
                                            value="${result.realPart}"
                                            maxFractionDigits="6"
                                    />
                                    +
                                    <fmt:formatNumber
                                            value="${result.imaginaryPart}"
                                            maxFractionDigits="6"
                                    />i
                                </td>
                            </tr>

                            <tr>
                                <th>Akar kedua</th>
                                <td class="complex">
                                    <fmt:formatNumber
                                            value="${result.realPart}"
                                            maxFractionDigits="6"
                                    />
                                    -
                                    <fmt:formatNumber
                                            value="${result.imaginaryPart}"
                                            maxFractionDigits="6"
                                    />i
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </table>
            </section>
        </c:if>
    </main>
</div>
</body>

</html>