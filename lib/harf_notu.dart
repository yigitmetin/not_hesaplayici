import 'package:flutter/material.dart';
import 'ders.dart';

String harfNotuHesapla(Ders ders) { // harf notu hesaplama fonksiyonu
  double ortalama = (ders.vizeNotu * 0.4 + ders.finalNotu * 0.6);
  if (ders.finalNotu < 45) {
    return 'FF';
  } else if (ortalama >= 85) {
    return 'AA';
  } else if (ortalama >= 75) {
    return 'BA';
  } else if (ortalama >= 65) {
    return 'BB';
  } else if (ortalama >= 57) {
    return 'CB';
  } else if (ortalama >= 50) {
    return 'CC';
  } else if (ortalama >= 45) {
    return 'DC';
  } else if (ortalama >= 40) {
    return 'DD';
  } else if (ortalama >= 30) {
    return 'FD';
  } else {
    return 'FF';
  }
}

Color harfNotuRenk(Ders ders) { // harf notunun ff ve fd olması durumunda kırmızı olması için renk sınıfı
  String harfNotu = harfNotuHesapla(ders);
  if (harfNotu == 'FD' || harfNotu == 'FF') {
    return Colors.red;
  } else {
    return Colors.black;
  }
}
