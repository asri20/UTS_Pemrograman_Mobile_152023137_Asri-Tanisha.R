// lib/screens/kalkulator_screen.dart

import 'package:flutter/material.dart';
import 'dart:math'; // Diperlukan untuk fungsi akar kuadrat (sqrt) dan pow

class KalkulatorScreen extends StatefulWidget {
  const KalkulatorScreen({super.key});

  @override
  State<KalkulatorScreen> createState() => _KalkulatorScreenState();
}

class _KalkulatorScreenState extends State<KalkulatorScreen> {
  String _output = "0"; // Hasil yang ditampilkan di layar
  double _num1 = 0.0;
  String _operand = ""; // Operator yang dipilih (+, -, *, /)
  String _input = ""; // Input yang sedang dimasukkan

  // Fungsi untuk menangani penekanan tombol
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // Tombol Hapus/Clear
        _output = "0";
        _num1 = 0.0;
        _operand = "";
        _input = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
        // Tombol Operasi Dasar
        if (_input.isNotEmpty) {
          _num1 = double.parse(_input);
          _operand = buttonText;
          _input = "";
        }
      } else if (buttonText == ".") {
        // Tombol Desimal
        if (!_input.contains(".")) {
          _input = _input.isEmpty ? "0." : _input + buttonText;
        }
      } else if (buttonText == "=") {
        // Tombol Sama Dengan
        if (_operand.isNotEmpty && _input.isNotEmpty) {
          double num2 = double.parse(_input);
          
          if (_operand == "+") _output = (_num1 + num2).toString();
          if (_operand == "-") _output = (_num1 - num2).toString();
          if (_operand == "×") _output = (_num1 * num2).toString();
          if (_operand == "÷") {
            _output = (num2 != 0) ? (_num1 / num2).toString() : "Error";
          }
          
          _num1 = 0.0;
          _operand = "";
          _input = _output; // Memungkinkan hasil digunakan untuk perhitungan selanjutnya
        }
      } else if (buttonText == "x²") {
        // Tombol Kuadrat
        if (_input.isNotEmpty) {
          double val = double.parse(_input);
          _output = pow(val, 2).toString();
          _input = _output;
        }
      } else if (buttonText == "√") {
        // Tombol Akar Kuadrat
        if (_input.isNotEmpty) {
          double val = double.parse(_input);
          if (val >= 0) {
             _output = sqrt(val).toString();
             _input = _output;
          } else {
             _output = "Error";
             _input = "";
          }
        }
      } else {
        // Tombol Angka
        _input += buttonText;
        _output = _input;
      }
      
      // Menghilangkan '.0' jika angka adalah bilangan bulat
      if (_output.endsWith(".0")) {
        _output = _output.substring(0, _output.length - 2);
      }
    });
  }

  // Widget untuk membuat tombol kalkulator
  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Area Tampilan Hasil
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _output, // Menampilkan hasil perhitungan/input
            style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
        
        // Area Tombol Kalkulator
        Column(
          children: [
            // Baris 1: C, ^2, √, ÷
            Row(
              children: [
                _buildButton("C", Colors.redAccent), // Tombol Hapus
                _buildButton("x²", Colors.indigo), // Tombol Kuadrat
                _buildButton("√", Colors.indigo), // Tombol Akar Kuadrat
                _buildButton("÷", Colors.orange), // Tombol Bagi
              ],
            ),
            // Baris 2: 7, 8, 9, ×
            Row(
              children: [
                _buildButton("7", Colors.grey.shade800),
                _buildButton("8", Colors.grey.shade800),
                _buildButton("9", Colors.grey.shade800),
                _buildButton("×", Colors.orange), // Tombol Kali
              ],
            ),
            // Baris 3: 4, 5, 6, -
            Row(
              children: [
                _buildButton("4", Colors.grey.shade800),
                _buildButton("5", Colors.grey.shade800),
                _buildButton("6", Colors.grey.shade800),
                _buildButton("-", Colors.orange), // Tombol Kurang
              ],
            ),
            // Baris 4: 1, 2, 3, +
            Row(
              children: [
                _buildButton("1", Colors.grey.shade800),
                _buildButton("2", Colors.grey.shade800),
                _buildButton("3", Colors.grey.shade800),
                _buildButton("+", Colors.orange), // Tombol Tambah
              ],
            ),
            // Baris 5: 0, ., =
            Row(
              children: [
                // Tombol 0 diperluas agar lebih lebar
                Expanded(flex: 2, child: _buildButton("0", Colors.grey.shade800)), 
                _buildButton(".", Colors.grey.shade800),
                _buildButton("=", Colors.green),
              ],
            ),
          ],
        ),
      ],
    );
  }
}