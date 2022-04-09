class Lamp {
  late String name;
  late String  id;
  bool isSwitchOff = false;
  int value = 0;
  Lamp({
    required this.name,
    required this.id,
  });
  void isOn() {
    isSwitchOff = true;
  }

  void setvalue(value) {
    value = value;
  }

  // ignore: unnecessary_this
  String getName() {
    return name;
  }
}
