<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soal John Volta - Form ke Logic Layer</title>
    <style>
        body {
            margin: 0;
            padding: 24px;
            background: #f3f4f6;
            font-family: Arial, sans-serif;
            color: #1f2937;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.08);
            padding: 28px;
        }
        h1 {
            margin: 0 0 8px;
        }
        .subtitle {
            margin: 0 0 20px;
            color: #4b5563;
        }
        section {
            margin-bottom: 16px;
            padding: 14px 16px;
            background: #f9fafb;
            border-radius: 8px;
            border-left: 4px solid #2563eb;
        }
        h2 {
            margin: 0 0 8px;
            font-size: 18px;
        }
        p, li {
            line-height: 1.6;
        }
        ul {
            margin: 8px 0 0 18px;
            padding: 0;
        }
        form {
            margin: 16px 0 22px;
            padding: 16px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            background: #f8fafc;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        input[type="text"] {
            width: 100%;
            max-width: 360px;
            padding: 10px;
            border: 1px solid #9ca3af;
            border-radius: 6px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        button {
            background: #2563eb;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px 14px;
            cursor: pointer;
        }
        .result {
            margin-top: 12px;
            padding: 12px;
            border-radius: 6px;
            background: #eff6ff;
            border-left: 4px solid #1d4ed8;
        }
    </style>
</head>
<body>
<main class="container">
    <h1>Soal John Volta</h1>
    <p class="subtitle">Form input JSP yang mengirim data ke logic layer (John Travolta logic).</p>

    <form action="${pageContext.request.contextPath}/john-volta" method="post">
        <label for="inputName">Masukkan nama (contoh: John Travolta)</label>
        <input id="inputName" name="inputName" type="text" value="${inputName}" placeholder="Ketik nama..." />
        <br/>
        <button type="submit">Proses ke Logic Layer</button>
    </form>

    <% if (request.getAttribute("resultMessage") != null) { %>
    <div class="result">
        <strong>Hasil Logic Layer:</strong>
        <p><%= request.getAttribute("resultMessage") %></p>
    </div>
    <% } %>

    <section>
        <h2>1. What - Apa itu Spring Framework?</h2>
        <p>Spring Framework adalah framework open-source berbasis Java untuk membangun aplikasi enterprise, dengan inti IoC dan DI agar pengembangan lebih fokus ke logika bisnis.</p>
    </section>

    <section>
        <h2>2. Why - Mengapa menggunakan Spring?</h2>
        <ul>
            <li>Modular: cukup pakai modul yang dibutuhkan.</li>
            <li>Mudah diuji karena komponen loosely coupled.</li>
            <li>Ekosistem kuat, termasuk Spring Boot untuk auto-configuration.</li>
        </ul>
    </section>

    <section>
        <h2>3. Who - Siapa pembuat dan penggunanya?</h2>
        <p>Spring diperkenalkan oleh Rod Johnson, lalu dikembangkan oleh Pivotal (kini bagian Broadcom/VMware) dan digunakan luas oleh engineer serta perusahaan besar.</p>
    </section>

    <section>
        <h2>4. When - Kapan tepat digunakan?</h2>
        <ul>
            <li>Untuk backend/enterprise berskala besar.</li>
            <li>Untuk arsitektur microservices.</li>
            <li>Untuk API RESTful kompleks dengan banyak integrasi.</li>
        </ul>
    </section>

    <section>
        <h2>5. Where - Di mana diaplikasikan?</h2>
        <p>Spring berjalan di sisi server, umumnya pada Tomcat/Jetty/Undertow, cloud platform, serta lingkungan container seperti Docker dan Kubernetes.</p>
    </section>
</main>
</body>
</html>