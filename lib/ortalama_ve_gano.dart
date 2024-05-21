import 'ders.dart';

double ortalamaHesapla(List<Ders> dersler) { // liste boşsa çalıştırmaz, eklenen derslerin ortalama ve gano değerini tutar.
  if (dersler.isEmpty) {
    return 0;
  }

  int toplamAKTS = 0;
  double toplamNot = 0;

  for (var ders in dersler) { // aktsler ve toplam notları tutar, ortalamalarını alır
    toplamAKTS += ders.akts;
    toplamNot += (ders.vizeNotu * 0.4 + ders.finalNotu * 0.6) * ders.akts;
  }

  return toplamNot / toplamAKTS;
}

double ortalamaHesaplaDers(Ders ders) { // ortalama hesaplama fonksiyonu, sonucu döndürür.
  return (ders.vizeNotu * 0.4 + ders.finalNotu * 0.6);
}

double ganoHesapla(double ortalama) { // gano hesaplama fonksiyonu, sonucu döndürür.
  return ortalama / 25;
}
