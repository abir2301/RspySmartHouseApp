import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackingProvider extends ChangeNotifier {
  IconData icon = Icons.radio_button_unchecked;
  bool exist = true;
  void onExist() {
    icon = Icons.radio_button_checked;
    print("on");
    exist = !exist;
    notifyListeners();
  }

  void offExist() {
    icon = Icons.radio_button_unchecked;
    exist = !exist;
    print("off");

    notifyListeners();
  }

  void changeExist() {
    if (exist) {
      offExist();
    } else {
      onExist();
    }
    notifyListeners();
  }
}
