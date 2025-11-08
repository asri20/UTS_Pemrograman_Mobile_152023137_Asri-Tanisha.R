// lib/data/static_data.dart

class StaticData {
  
  // Data Statis untuk Halaman Kontak (Tetap 15 kontak Anda)
  static const List<Map<String, String>> contacts = const [
    {'name': 'Ikrima Nurul Hidayat', 'phone': '0812-XXXX-1111', 'initial': 'IH'},
    {'name': 'Sondang Angelina Nadeak', 'phone': '0812-XXXX-2222', 'initial': 'SN'},
    {'name': 'Angelina Geosianna', 'phone': '0812-XXXX-3333', 'initial': 'AG'},
    {'name': 'Rida Rahmadani', 'phone': '0812-XXXX-4444', 'initial': 'RR'},
    {'name': 'Elshinta Rumapea', 'phone': '0812-XXXX-5555', 'initial': 'ER'},
    {'name': 'Mamakk Tersayang', 'phone': '0812-XXXX-6666', 'initial': 'MM'},
    {'name': 'My Future Self', 'phone': '0812-XXXX-7777', 'initial': 'FS'},
    {'name': 'Gita Larasati', 'phone': '0812-XXXX-8888', 'initial': 'GL'},
    {'name': 'Hadi Nurcahyo', 'phone': '0812-XXXX-9999', 'initial': 'HN'},
    {'name': 'Irma Suryani', 'phone': '0812-XXXX-0000', 'initial': 'IS'},
    {'name': 'Joko Susilo', 'phone': '0812-XXXX-1010', 'initial': 'JS'},
    {'name': 'Karin Melinda', 'phone': '0812-XXXX-1212', 'initial': 'KM'},
    {'name': 'Lukas Aditia', 'phone': '0812-XXXX-1313', 'initial': 'LA'},
    {'name': 'Mita Sari', 'phone': '0812-XXXX-1414', 'initial': 'MS'},
    {'name': 'Nanda Maulana', 'phone': '0812-XXXX-1515', 'initial': 'NM'},
  ];

  // Data Statis untuk Halaman Berita (HOT NEWS)
  static const List<Map<String, String>> newsItems = const [
    {
      'title': '🚨 Skandal Selebriti: Tiktokers Inisial "J" Diduga Terlibat Perselingkuhan!', 
      'source': 'Gossip Corner', 
      'date': '2025/11/07', 
      'image_asset': 'assets/selingkuh.jpg' // Perselingkuhan / Selebriti
    },
    {
      'title': '⚠️ Peringatan Dini: Gunung Berapi Anak Krakatau Alami Peningkatan Aktivitas Kritis', 
      'source': 'BMKG/BNPB', 
      'date': '2025/11/06', 
      'image_asset': 'assets/meletus.jpg' // Bencana
    },
    {
      'title': '📈 The Fed Tahan Suku Bunga, Pasar Saham Global Langsung Melonjak Tajam', 
      'source': 'Economic Review', 
      'date': '2025/11/06', 
      'image_asset': 'assets/bit.jpg' // Ekonomi
    },
    {
      'title': '🏆 Reuni Mendadak Bintang K-Pop Generasi 2, Fans Heboh di Media Sosial', 
      'source': 'K-Pop Insider', 
      'date': '2025/11/05', 
      'image_asset': 'assets/kpop.jpg' // Selebriti
    },
    {
      'title': '💵 Rupiah Melemah Drastis Terhadap Dolar AS, Pemerintah Siapkan Intervensi Pasar', 
      'source': 'FinanceToday', 
      'date': '2025/11/04', 
      'image_asset': 'assets/baya.jpg' // Ekonomi
    },
  ];
}