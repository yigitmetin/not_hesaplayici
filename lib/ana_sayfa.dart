import 'package:flutter/material.dart';
import 'ders.dart';
import 'ders_ekle.dart';
import 'duzenle.dart';
import 'ortalama_ve_gano.dart';
import 'harf_notu.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Ders> dersler = []; // Dersler listesi oluşturuldu

  @override
  Widget build(BuildContext context) {
    double ortalama = ortalamaHesapla(dersler); 
    double gano = ganoHesapla(ortalama);

    // yukarıda ortalama ve gano değişkenleri tanımlandı, ortalama_ve_gano.dart dosyasında bulunan fonksiyonlar çağırıldı.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Hesaplayıcı'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // Ders ekleme sayfasını temsil etmesi için + ikonu
            onPressed: () {
              _dersEklemeSayfasinaGit(context); // Basıldığında aşağıdaki ders ekleme sayfasına git fonksiyonu çalıştırıldı.
            },
          ),
        ],
      ),
      body: Padding(  // Ana sayfanın kişiselleştirilmesi ve özellikleri
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            dersler.isEmpty ? _buildEmptyState() : _buildDersListesi(),
            const SizedBox(height: 10),
            Text(
              'Ortalama: ${ortalama.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'GANO: ${gano.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDersListesi() { // sayfanın ortasındaki ders listesini gösterecek widget ve özellikleri
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Eklenen Dersler',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: dersler.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text('${dersler[index].ad} - Ortalama: ${ortalamaHesaplaDers(dersler[index]).toStringAsFixed(2)}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AKTS: ${dersler[index].akts} | Vize: ${dersler[index].vizeNotu} | Final: ${dersler[index].finalNotu}'),
                        const SizedBox(height: 5),
                        Text('Harf Notu: ${harfNotuHesapla(dersler[index])}', style: TextStyle(color: harfNotuRenk(dersler[index]))),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit), // her dersin yanında düzenle butonu ve ikonu
                          onPressed: () {
                            _dersiDuzenle(context, index); // ve onun fonksiyonu
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete), // her dersin yanında düzenle butonu ve ikonu
                          onPressed: () {
                            _dersiSil(context, index); // ve onun fonksiyonu
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() { // ders ekleme fonksiyonununun boş olduğu durumda gerçekleşecek fonksiyon
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 50),
          SizedBox(height: 10),
          Text(
            'Henüz girilmiş bir ders yok. Sağ üstte bulunan "+" butonuna tıklayarak ders ekleyebilirsiniz.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _dersEklemeSayfasinaGit(BuildContext context) async { // ekle butonu fonksiyonu
    final sonuc = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DersEklemeSayfasi()),
    );

    if (sonuc != null && sonuc is Ders) {
      setState(() {
        dersler.add(sonuc);
      });
    }
  }

  void _dersiDuzenle(BuildContext context, int index) async { // düzenle butonu fonksiyonu
    final sonuc = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DersDuzenlemeSayfasi(ders: dersler[index])),
    );

    if (sonuc != null && sonuc is Ders) {
      setState(() {
        dersler[index] = sonuc;
      });
    }
  }

  void _dersiSil(BuildContext context, int index) { // sil butonu fonksiyonu
    setState(() {
      dersler.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ders silindi.'),
      ),
    );
  }
}
