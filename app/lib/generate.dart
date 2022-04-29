import 'dart:math';

String getNumber() {
  Random random = Random();
  int randomNumber = random.nextInt(10000);
  return "id" + randomNumber.toString();
}
