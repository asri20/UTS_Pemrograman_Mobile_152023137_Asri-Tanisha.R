// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Animasi untuk fade-in
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    
    // Mulai animasi fade-in segera
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Pindah ke DashboardScreen setelah 5 detik
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan Container dengan Gradient sebagai pengganti Scaffold polos
    return Container(
      decoration: BoxDecoration(
        // Latar belakang Gradient Vertikal
        gradient: LinearGradient(
          colors: [Colors.white, Colors.deepPurple.shade100], 
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // AnimatedOpacity untuk efek fade-in modern
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1), // Durasi fade-in selama 1 detik
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // --- FOTO PROFILE DENGAN SHADOW & BORDER ---
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 80, // Ukuran Foto Lebih Besar
                  // Ganti 'asri.jpg' dengan nama file foto Anda
                  backgroundImage: AssetImage('assets/asri.jpg'), 
                ),
              ),
              const SizedBox(height: 40),

              // --- JUDUL APLIKASI (Lebih Menarik) ---
              const Text(
                'APLIKASI PEMROGRAMAN MOBILE UTS', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26, 
                  fontWeight: FontWeight.w900, // Sangat tebal
                  letterSpacing: 1.2, // Spasi huruf
                  color: Colors.deepPurple, // Warna kontras
                ),
              ),
              const SizedBox(height: 20),

              // --- NIM dan NAMA ---
              const Text(
                'NIM: 152023137', 
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.black54,
                ),
              ),
              const Text(
                'Nama: Asri Tanisha Rumapea', 
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 60),

              // --- Loading Indicator ---
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                strokeWidth: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}