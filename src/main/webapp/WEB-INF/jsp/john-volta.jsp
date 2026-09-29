<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soal John Volta - 5W Spring Framework</title>
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
    </style>
</head>
<body>
<main class="container">
    <h1>Soal John Volta</h1>
    <p class="subtitle">Ringkasan isi soal pada README: 5W tentang Spring Framework.</p>

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
