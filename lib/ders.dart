// ders classı ve kesinlikle boş olmaması için required this kullanımı

class Ders {
  String ad;
  int akts;
  int vizeNotu;
  int finalNotu;

  Ders({
    required this.ad,
    required this.akts,
    required this.vizeNotu,
    required this.finalNotu,
  });
}
