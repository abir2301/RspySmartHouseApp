import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../DataBase/lamp.dart';

class LampWidget extends StatefulWidget {
  final Lamp lamp;
  const LampWidget({
    Key? key,
    required this.lamp,
    //required Key key,
  }) : super(key: key); //super(key: key);

  @override
  State<LampWidget> createState() => _LampWidgetState();
}

class _LampWidgetState extends State<LampWidget> {
  final database = FirebaseDatabase.instance.ref();
  double _curentvalue = 1;
  IconData lightOn = Icons.highlight;
  IconData lightOff = Icons.highlight_off;
  late IconData icon = lightOff;
  late Lamp lamp;
  @override
  void initState() {
    super.initState();
    lamp = widget.lamp;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final LampRef = database.child('/Home/lamp');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(lamp.name, style: Theme.of(context).textTheme.headline2),
        Row(
          children: [
            Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.grey,
                ),
                //color: Colors.pink,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  icon,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Slider(
                activeColor: Colors.blue,
                value: _curentvalue,
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (double value) {
                  _curentvalue = value;
                  print(_curentvalue);
                  setState(() {
                    if (value == 10) {
                      icon = lightOn;
                      try {
                        final lampdb = <String, dynamic>{
                          //'id': lamp.id.toString(),
                          'state': "True"
                        };
                        LampRef.set(lampdb).then((value) {
                          print("llamp updated  ");
                          //trafic.toString();
                        }).catchError((e) {
                          // ignore: avoid_print
                          print("error" + e.toString());
                        });
                      } catch (e) {
                        // ignore: avoid_print
                        print("error" + e.toString());
                      }
                    } else {
                      icon = lightOff;
                    }
                    if (value <= 1) {
                      icon = lightOff;
                      try {
                        final lampdb = <String, dynamic>{
                          // 'id': lamp.id.toString(),
                          'state': "False"
                        };
                        LampRef.set(lampdb).then((value) {
                          print("llamp updated ");
                          //trafic.toString();
                        }).catchError((e) {
                          // ignore: avoid_print
                          print("error" + e.toString());
                        });
                      } catch (e) {
                        // ignore: avoid_print
                        print("error" + e.toString());
                      }
                    }
                  });
                }),
            const SizedBox(
              width: 10,
            ),
            Text(
              (_curentvalue.round()).toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
