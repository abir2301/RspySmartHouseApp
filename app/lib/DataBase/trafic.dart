class Trafic {
  late String id;
  late String date;
  static List<Trafic> list = [];
  static List<TraficDate> traficListNumber = [];

  Trafic({required this.id, required this.date}) {
    list.add(this);
    int nb = numTrafic(date.substring(
      11,
    ));
    // ignore: unused_local_variable
    TraficDate traficDate = TraficDate(
        date: date.substring(
          11,
        ),
        nb: nb);
    Trafic.traficListNumber.add(traficDate);
  }

  factory Trafic.fromRTDB(Map<String, dynamic> data) {
    return Trafic(
        id: data['id'] ?? 'an initial id ', date: data['date'] ?? "date");
  }
  String tostring() {
    return (" hii there is new trafic id =" +
        id.toString() +
        "date = " +
        date.toString());
  }

  static void traficList() {
    for (Trafic i in Trafic.list) {
      print(i.tostring());
    }
  }

  static void TraficDataListAff() {
    print("traficdatelist ");
    for (TraficDate i in Trafic.traficListNumber) {
      print(i.traficDataString());
    }
  }

  static int numTrafic(String date) {
    int nb = 0;
    for (Trafic i in Trafic.list) {
      String ch = i.date.substring(
        11,
      );
      // ignore: prefer_contains
      if (date.indexOf(ch) >= 0) {
        nb++;
      }
    }
    return nb;
  }
}

class TraficDate {
  late String date;
  late int nb;
  TraficDate({required this.date, required this.nb});
  String traficDataString() {
    return 'date =' + this.date + " nb == " + "${this.nb} +\n";
  }
}
