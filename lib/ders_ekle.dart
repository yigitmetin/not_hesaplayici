import 'package:flutter/material.dart';
import 'ders.dart';

class DersEklemeSayfasi extends StatefulWidget {
  const DersEklemeSayfasi({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DersEklemeSayfasiState createState() => _DersEklemeSayfasiState();
}

class _DersEklemeSayfasiState extends State<DersEklemeSayfasi> { // kontrolleri sağlar
  TextEditingController adController = TextEditingController();
  TextEditingController aktsController = TextEditingController();
  TextEditingController vizeNotuController = TextEditingController();
  TextEditingController finalNotuController = TextEditingController();

  @override
  Widget build(BuildContext context) { // ders ekleme sayfasının widgeti
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Ders Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: adController,
              decoration: const InputDecoration(labelText: 'Ders Adı'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: aktsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'AKTS'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: vizeNotuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Vize Notu'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: finalNotuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Final Notu'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _dersEkle(context);
              },
              child: const Text('Ders Ekle'),
            ),
          ],
        ),
      ),
    );
  }

  void _dersEkle(BuildContext context) { // ders ekleme fonksiyonu ve kontrolleri
    String ad = adController.text;
    int akts = int.tryParse(aktsController.text) ?? 0;
    int vizeNotu = int.tryParse(vizeNotuController.text) ?? 0;
    int finalNotu = int.tryParse(finalNotuController.text) ?? 0;

    if (ad.isNotEmpty && akts > 0 && vizeNotu >= 0 && vizeNotu <= 100 && finalNotu >= 0 && finalNotu <= 100) {
      Ders yeniDers = Ders(
        ad: ad,
        akts: akts,
        vizeNotu: vizeNotu,
        finalNotu: finalNotu,
      );

      Navigator.pop(context, yeniDers);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen geçerli bir ders bilgisi girin.'),
        ),
      );
    }
  }
}
