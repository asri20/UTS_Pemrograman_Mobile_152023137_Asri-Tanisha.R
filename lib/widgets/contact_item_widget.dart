// lib/widgets/contact_item_widget.dart

import 'package:flutter/material.dart';

class ContactItemWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String initial;
  final VoidCallback? onTap; 

  const ContactItemWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.initial,
    this.onTap, // Dibuat opsional
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15), 
      elevation: 8, // Elevasi lebih tinggi untuk efek mengambang
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), // Sudut lebih bulat
      child: InkWell( 
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children: <Widget>[
              // --- Circle Image/Avatar (Desain Lebih Menarik) ---
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple.shade50, // Latar belakang avatar yang lembut
                  border: Border.all(color: Colors.deepPurple, width: 2), // Border ungu
                ),
                child: Center(
                  child: Text(
                    initial, // Inisial nama
                    style: TextStyle(
                      color: Colors.deepPurple.shade700, 
                      fontSize: 26, 
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),

              // --- Teks Nama dan Telepon ---
              Expanded( // Menggunakan Expanded agar Column mengisi ruang
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 15, 
                        color: Colors.grey.shade600, 
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              // --- Ikon Aksi (Tombol Telepon) ---
              const Icon(Icons.phone_in_talk, color: Colors.deepPurple, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}