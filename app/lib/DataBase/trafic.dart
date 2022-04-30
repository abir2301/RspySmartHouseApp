class Trafic {
  late String id;
  late String date;
  Trafic({required this.id, required this.date});
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
}

// void _activateListners() async {
//     Stream<DatabaseEvent> stream = database.child('Home/trafic/sensor').onValue;
//     try {
//       stream.listen((DatabaseEvent event) {
//         final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
//         final trafic = Trafic.fromRTDB(data);
//         setState(() {
//           text = trafic.tostring();
//         });
//       });
//     } on Exception catch (e) {
//       print(e.toString());
//       // TODO
//     }
//   }
//  ElevatedButton(
//                         onPressed: () async {
//                           try {
//                             final trafic = <String, dynamic>{
//                               'id': getNumber(),
//                               'date': DateTime.now().toString()
//                             };
//                             await traficRref
//                                 .push()
//                                 .set(trafic)
//                                 .then((value) => print("trafic is inserted "))
//                                 .catchError((e) {
//                               // ignore: avoid_print
//                               print("error" + e.toString());
//                             });
//                           } catch (e) {
//                             // ignore: avoid_print
//                             print("error" + e.toString());
//                           }
//                         },
//                         child: const Text("add  to db ")),
//                     Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(text),
//                     ),