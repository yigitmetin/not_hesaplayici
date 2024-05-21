import 'package:flutter/material.dart';
import 'ana_sayfa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp'ın özelliklerini kişiselleştirme.
      title: 'Not Hesaplayıcı',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
      ),
      debugShowCheckedModeBanner: false, // Sağ üstteki debug etiketini kaldırma
      home: const AnaSayfa(), // Anasayfayı ana_sayfa.dart dosyasındaki AnaSayfa classı olarak tanımlama
    );
  }
}