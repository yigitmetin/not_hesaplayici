import 'package:flutter/material.dart';
import 'ders.dart';

class DersDuzenlemeSayfasi extends StatefulWidget {
  final Ders ders;

  const DersDuzenlemeSayfasi({super.key, required this.ders});

  @override
  // ignore: library_private_types_in_public_api
  _DersDuzenlemeSayfasiState createState() => _DersDuzenlemeSayfasiState();
}

class _DersDuzenlemeSayfasiState extends State<DersDuzenlemeSayfasi> { // kontrolleri sağlar
  late TextEditingController adController;
  late TextEditingController aktsController;
  late TextEditingController vizeNotuController;
  late TextEditingController finalNotuController;

  @override
  void initState() { // başlangıç değerleri ve başlatma
    super.initState();
    adController = TextEditingController(text: widget.ders.ad);
    aktsController = TextEditingController(text: widget.ders.akts.toString());
    vizeNotuController = TextEditingController(text: widget.ders.vizeNotu.toString());
    finalNotuController = TextEditingController(text: widget.ders.finalNotu.toString());
  }

  @override
  Widget build(BuildContext context) { // ders düzenle sayfası özellikleri
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ders Düzenle'),
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
                _dersDuzenle(context);
              },
              child: const Text('Dersi Düzenle'),
            ),
          ],
        ),
      ),
    );
  }

  void _dersDuzenle(BuildContext context) { // düzenleme fonksiyonu
    String ad = adController.text;
    int akts = int.tryParse(aktsController.text) ?? 0;
    int vizeNotu = int.tryParse(vizeNotuController.text) ?? 0;
    int finalNotu = int.tryParse(finalNotuController.text) ?? 0;

    if (ad.isNotEmpty && akts > 0 && vizeNotu >= 0 && vizeNotu <= 100 && finalNotu >= 0 && finalNotu <= 100) {
      Ders duzenlenenDers = Ders(
        ad: ad,
        akts: akts,
        vizeNotu: vizeNotu,
        finalNotu: finalNotu,
      );

      Navigator.pop(context, duzenlenenDers);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen geçerli bir ders bilgisi girin.'),
        ),
      );
    }
  }

  @override
  void dispose() { // elden çıkarma modeli kullanımı
    adController.dispose();
    aktsController.dispose();
    vizeNotuController.dispose();
    finalNotuController.dispose();
    super.dispose();
  }
}
