JAWABAN SOAL NO.1 UTS 
Projek ini dikembangkan menggunakan Flutter dan Dart sebagai pemenuhan UTS mata kuliah pemrograman Mobile. aplikasi ini dirancang untuk menerapkan berbagai jenis layout dan widget.

Nama: Asri Tanisha Rumapea
Nrp:  152023137
Kelas:  B

implementasi Halaman Aplikasi 
A. Halaman Awal:Splash Screen(5 detik)
Deskripsi: Halaman loading awal yang wajib muncul 5 detik
menggunakan gradient background dan animatedOpacity untuk fade-in yang elegan. nah untuk visual nya biar menarik saya menggunakan Fluuter web yang dikombinasikan dengan tool device Frame.jadi tampialnnya sudah benar benar seperti di smartphone.
Konten:Judul Aplikasi, Foto Profil,Nim,Nama
[gambar Sreenshoot Splash Screen]

<img width="781" height="488" alt="visual" src="https://github.com/user-attachments/assets/162500dc-e2de-4de6-ac1b-294baa2b9104" />

<img width="350" height="468" alt="screen_flash" src="https://github.com/user-attachments/assets/c3c84b86-5f14-49c5-b805-eb164253a4af" />


B. Halaman Dashboard
Deskripsi: Menu utama aplikasi diimplementasikan menggunakan bottom Navigation Bar. setiap item menu terhubung ke Fragment(Wigget/Screen)yang terpisah.semua menu(Biodata,Kontak,Kalkulator,Cuaca,Berita)sudah dapat dipilih.
[gambar Sreenshoot Dashboard]

<img width="375" height="469" alt="dashboard" src="https://github.com/user-attachments/assets/7b815931-5302-4d4f-90ba-d973963a535f" />

C.Halaman Biodata
layout input data yang di disain modern menggunakan card dan border .widget yang digunakan ada TextField(Nama),celender(Data picker yaang terhubung ke TextField),Dropdown(jenis kelamin,dan radio button(status pernikahan). nah disini kita tidak terhubung ke database sehingga data nya masih yang bersifaat statis.
[gambar Sreenshoot Biodata]

<img width="349" height="468" alt="biodata" src="https://github.com/user-attachments/assets/cfe24ce1-13a3-42d1-85c6-cbc7339142b2" />

D.Halaman Kontak
Deskripsi:
data kontak juga masih statis.dimana dayanya di ambil dari var static_data.dart. disini juga saya menambahkan fitur search bar.dimana daftar kontak akan difilter secara real-time menggunakan method fiterContacts dan setState.
[gambar Sreenshoot Kontak]
<img width="344" height="473" alt="kontak1" src="https://github.com/user-attachments/assets/d3e89b05-353e-4b4f-96f3-a82e9a62e208" />

<img width="368" height="472" alt="kontak2" src="https://github.com/user-attachments/assets/16965b84-083a-450a-8636-a76885eb3c20" />


E.Halaman Kalkulator
Deskripsi:
Kalkulator sederhaana dengan logika sudah mampu melakukan operasi tambah,kurang,kali,bagi,serta fungsi kuadrat dan akar kuadrat.juga sudah ada tombol hapus.
[gambar Sreenshoot kalkulator]

<img width="343" height="468" alt="kalkulator" src="https://github.com/user-attachments/assets/779f80e0-f160-4471-a4ec-f28459fc53b3" />


F.Halaman Cuaca
Deskripsi:
menggunakan informasi cuaca statis dimana disimpan dalam list dart internal.dengaan beberapa fitur layout.dana ada dua list terpisah yang ditampilkan yaitu per jam dan per hari.
[gambar Sreenshoot cuaca]

<img width="340" height="466" alt="cuaca1" src="https://github.com/user-attachments/assets/94703c15-b60c-47e7-9681-a0cc290305cd" />

<img width="362" height="479" alt="cuaca2" src="https://github.com/user-attachments/assets/7acac046-6818-4c28-98b8-80131765a1d4" />


G. Halaman Berita
Deskripsi:
dengan data statis juga dalam pola tampilan berulang.
[gambar v berita]

<img width="344" height="468" alt="berita" src="https://github.com/user-attachments/assets/cd707b15-c5ea-4c0e-92ec-654a2f87abd4" />




