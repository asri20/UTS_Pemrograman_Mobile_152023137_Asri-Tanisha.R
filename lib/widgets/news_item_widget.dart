// lib/widgets/news_item_widget.dart

import 'package:flutter/material.dart';

class NewsItemWidget extends StatelessWidget {
  final String title;
  final String source;
  final String date;
  final String imageAsset;

  const NewsItemWidget({
    super.key,
    required this.title,
    required this.source,
    required this.date,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card yang lebih menonjol dengan sudut melengkung
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      elevation: 6, // Bayangan yang ditingkatkan
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell( // Membuat seluruh item bisa diklik (UX)
        onTap: () {
          // Aksi saat berita diklik
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Membaca berita: $title')),
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // --- Gambar Berita (Menggunakan Aset GAMBAR) ---
              Container(
                width: 100,
                height: 80,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // Menggunakan imageAsset yang dikirim dari static_data.dart
                  image: DecorationImage(
                    image: AssetImage(imageAsset), 
                    fit: BoxFit.cover, // Agar gambar menutupi area container
                    // Jika gambar gagal dimuat (misal: nama file salah), 
                    // kita bisa menggunakan warna sebagai fallback.
                    onError: (exception, stackTrace) => Colors.deepPurple.shade100,
                  ),
                ),
              ),

              // --- Detail Berita ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Judul (Lebih menonjol)
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700, // Semi-bold
                        fontSize: 16, 
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Sumber dan Tanggal (Lebih terstruktur)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          source, 
                          style: const TextStyle(
                            fontSize: 13, 
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple, // Warna sumber
                          ),
                        ),
                        Text(
                          date, 
                          style: TextStyle(
                            fontSize: 12, 
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}