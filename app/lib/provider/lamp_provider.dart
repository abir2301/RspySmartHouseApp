import 'package:flutter/cupertino.dart';

import '../DataBase/lamp.dart';

// ignore: camel_case_types
class LampsProvider extends ChangeNotifier {
// ignore: prefer_final_fields, unused_field
  List<String> lampId = [];
  List<Lamp> lamps = [
    Lamp(name: "Leaving Room ", id: "1"),
    Lamp(name: "Bedroom ", id: "2"),
    
  ];
  void addLamp(Lamp lamp) {
    lamps.add(lamp);
    lampId.add(lamp.id);
    notifyListeners();
  }

  void removeLamp(Lamp lamp) {
    lamps.remove(lamp);
    notifyListeners();
  }
}
