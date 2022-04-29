import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingProvider extends ChangeNotifier {
  IconData icon = Icons.radio_button_unchecked;
  bool exist = true;
  void changeExistBool() {
    exist = !exist;
    notifyListeners();
  }

  void onExist() {
    icon = Icons.radio_button_checked;
    print("exist =" + exist.toString());
    changeExistBool();
    notifyListeners();
  }

  void offExist() {
    icon = Icons.radio_button_unchecked;
    print(exist);
    changeExistBool();
    // print("off");
    notifyListeners();
  }

  void changeExist() {
    if (exist) {
      offExist();
    } else {
      onExist();
    }
    print("changed ");
    notifyListeners();
  }
}
