// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
// Impor semua screens/fragments menu
import 'biodata_screen.dart';
import 'kontak_screen.dart';
import 'kalkulator_screen.dart';
import 'cuaca_screen.dart';
import 'berita_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Daftar semua menu/fragment yang akan ditampilkan di body
  static const List<Widget> _widgetOptions = <Widget>[
    BiodataScreen(),
    KontakScreen(),
    KalkulatorScreen(),
    CuacaScreen(),
    BeritaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan Bottom Navigation Bar sebagai implementasi menu navigasi
    return Scaffold(
      appBar: AppBar(
        title: Text(['Biodata', 'Kontak', 'Kalkulator', 'Cuaca', 'Berita'][_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        // Tampilkan screen/fragment yang dipilih
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Penting agar item tidak hilang jika banyak
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Biodata'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontak'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Cuaca'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Berita'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}