// lib/screens/biodata_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

enum MarriageStatus { single, married }

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key});

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  // Variabel untuk menyimpan state input data
  String? _selectedGender;
  MarriageStatus? _selectedStatus = MarriageStatus.single;
  DateTime? _selectedDate;

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(text: "Asri Tanisha Rumapea"); // Nilai awal statis

  // Fungsi untuk menampilkan Date Picker (Calendar)
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000), // Default 2000
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple, // Warna Calendar sesuai tema
              onPrimary: Colors.white,
              onSurface: Colors.deepPurple,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd MMMM yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. FOTO PROFILE 
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.deepPurple, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 70, // Ukuran lebih besar
                  backgroundImage: AssetImage('assets/asri.jpg'), // Foto Anda
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
            
            // 2. JUDUL SECTION
            _buildTitle('📝 Informasi Dasar'),

            // --- KARTU INPUT DATA ---
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // A. ISIAN TEKS: Nama
                    TextField(
                      controller: _nameController,
                      decoration: _inputDecoration('Nama Lengkap', Icons.badge),
                    ),
                    const SizedBox(height: 15),

                    // B. ISIAN CALENDAR
                    TextField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context), 
                      decoration: _inputDecoration('Tanggal Lahir', Icons.calendar_today),
                    ),
                    const SizedBox(height: 15),
                    
                    // C. DROPDOWN: Jenis Kelamin
                    DropdownButtonFormField<String>(
                      decoration: _inputDecoration('Jenis Kelamin', Icons.wc),
                      value: _selectedGender,
                      hint: const Text('Pilih Jenis Kelamin'),
                      items: const ['Pria', 'Wanita']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),

            // 3. JUDUL SECTION STATUS PERNIKAHAN
            _buildTitle('💍 Status Pernikahan'),

            // --- RADIO BUTTON ---
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  _buildRadioListTile('Belum Menikah', MarriageStatus.single),
                  const Divider(height: 0),
                  _buildRadioListTile('Sudah Menikah', MarriageStatus.married),
                ],
              ),
            ),

            const SizedBox(height: 50),

            // 4. TOMBOL SIMPAN
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data Biodata berhasil diinput (Statis).')),
                  );
                },
                icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                label: const Text('Simpan Data', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper Widget untuk Judul Section
  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22, 
          fontWeight: FontWeight.w800, 
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  // Helper Widget untuk InputDecoration yang seragam
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.deepPurple),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      prefixIcon: Icon(icon, color: Colors.deepPurple),
    );
  }

  // Helper Widget untuk Radio Button
  Widget _buildRadioListTile(String title, MarriageStatus value) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      leading: Radio<MarriageStatus>(
        value: value,
        groupValue: _selectedStatus,
        activeColor: Colors.deepPurple,
        onChanged: (MarriageStatus? newValue) {
          setState(() {
            _selectedStatus = newValue;
          });
        },
      ),
    );
  }
}