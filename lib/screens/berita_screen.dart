// lib/screens/berita_screen.dart

import 'package:flutter/material.dart';
import 'package:uts_mobile/data/static_data.dart'; 
import 'package:uts_mobile/widgets/news_item_widget.dart';

class BeritaScreen extends StatelessWidget {
  const BeritaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data berita statis
    final newsItems = StaticData.newsItems;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final news = newsItems[index];

        // Menggunakan NewsItemWidget yang sudah dibuat
        return NewsItemWidget(
          title: news['title']!,
          source: news['source']!,
          date: news['date']!,
          imageAsset: news['image_asset']!, 
        );
      },
    );
  }
}