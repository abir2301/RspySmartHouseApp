import 'dart:math';

String getNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(10000000);
  return randomNumber.toString();
}
