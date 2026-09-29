## 5W: Spring Framework

**1. Apa itu Spring Framework? (What)**
Spring Framework adalah kerangka kerja (*framework*) *open-source* berbasis Java yang sangat komprehensif untuk membangun aplikasi tingkat perusahaan (*enterprise*). Spring menyediakan infrastruktur dasar yang memungkinkan pengembang untuk membuat aplikasi Java yang cepat, aman, dan mudah dikelola dengan fokus pada logika bisnis, tanpa harus terjebak dalam kerumitan konfigurasi *boilerplate*. Fitur intinya adalah *Inversion of Control* (IoC) dan *Dependency Injection* (DI).

**2. Mengapa menggunakan Spring Framework? (Why)**
Spring secara drastis menyederhanakan pengembangan aplikasi Java klasik (Java EE) yang sebelumnya terkenal berat dan kompleks. Alasan utamanya meliputi:

* **Modularitas:** Anda hanya perlu memasukkan modul atau *library* yang Anda butuhkan (misalnya Spring MVC untuk web, Spring Data untuk *database*, atau Spring Security untuk keamanan).
* **Pengujian (*Testing*):** Konsep DI membuat komponen aplikasi tidak saling bergantung (*loosely coupled*), sehingga kode jauh lebih mudah diuji (*unit testing*).
* **Ekosistem Kuat:** Kehadiran ekstensi seperti **Spring Boot** membuat konfigurasi dan *deployment* aplikasi menjadi sangat cepat (*auto-configuration*).

**3. Siapa yang membuat dan menggunakannya? (Who)**

* **Pembuat:** Spring pertama kali diciptakan oleh **Rod Johnson** (diperkenalkan dalam bukunya tahun 2002, dan dirilis pada 2003). Saat ini, Spring dikembangkan dan dikelola oleh Pivotal Software (sekarang bagian dari Broadcom/VMware).
* **Pengguna:** Digunakan oleh jutaan *Software Engineer* (khususnya pengembang Java dan Kotlin) di seluruh dunia. Perusahaan teknologi raksasa seperti Netflix, Alibaba, Amazon, dan berbagai bank skala global menjadikannya sebagai tulang punggung sistem *backend* mereka.

**4. Kapan waktu yang tepat menggunakan Spring Framework? (When)**
Spring sangat ideal digunakan ketika:

* Membangun aplikasi *backend* dan sistem *enterprise* berskala besar yang membutuhkan tingkat keamanan dan keandalan tinggi.
* Mengembangkan arsitektur **Microservices**. Ekosistem Spring (melalui Spring Cloud dan Spring Boot) dirancang khusus untuk mempermudah pembuatan dan pengelolaan layanan mikro yang saling terhubung.
* Membuat API RESTful yang kompleks dan perlu terintegrasi dengan berbagai macam sistem pihak ketiga atau *database* relasional/NoSQL.

**5. Di mana Spring diaplikasikan? (Where)**
Spring berjalan di lingkungan pengembangan *backend* (*server-side*). Aplikasi yang dibangun menggunakan Spring umumnya di-*deploy* di:

* Server aplikasi berbasis Java (seperti Apache Tomcat, Jetty, atau Undertow yang kini sudah tertanam langsung (*embedded*) jika menggunakan Spring Boot).
* Platform *Cloud* modern (AWS, Google Cloud, Microsoft Azure).
* Lingkungan orkestrasi *container* masa kini (seperti Docker dan Kubernetes), menjadikannya sangat cocok untuk era *Cloud-Native*.


## Soal john travolta
Seoranga karyawan bernama john travolta bergaji mingguan. Gaji normal seminggu (untuk 40 jam), standarnya (“rate”) adalah: rp. 15.000,- /jam. Sedangakan untuk lembur (artinya kerja diatas 40 jam/minggu) dibayar satu setengah kali dari gaji normal per jam nya (“rate”).

1) Bila Mr. John travolta pada minggu ini bekerja 52 jam, berapa gaji mr. John tersebut. Buat alogaritma + program menghitung gaji dengan nilai-nilai yang lain/variatif: (“bebas”).
2) Bila pemasukan lebih besar dari pengeluaran maka, akan ditulis (di print), ”bisa menabung”. Bila pemasukan sama dengan pengeluaran maka, akan ditulis (di print), ”tidak bisa menabung”. Bila pemasukan sama kurang dari pengeluaran maka, akan ditulis (di print), ”cari tambahan”.
pengeluaran mr. john selama seminggu ini adalah rp. 600.000. Apakah Mr. john bisa menabung atau tidak ??. bila bisa, berapa besar tabungannya untuk minggu ini. Buat alogaritma + program menghitung tabungan minggu ini dengan nilai-nilai yang lain/variatif (“bebas”).