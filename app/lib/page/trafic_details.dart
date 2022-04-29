import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../generate.dart';

class TraficDetails extends StatefulWidget {
  const TraficDetails({Key? key}) : super(key: key);

  @override
  State<TraficDetails> createState() => _TraficDetailsState();
}

class _TraficDetailsState extends State<TraficDetails> {
  @override
  void initState() {
    super.initState();
    
    _activateListners();
  }

  void _activateListners() async {
    database.child('Home/trafic/sensor/id').onValue.listen((event) {
      setState(() {
        text = event.snapshot.value.toString();
      });
    });
  }

  final database = FirebaseDatabase.instance.ref();
  String text = "textContainer ";
  @override
  Widget build(BuildContext context) {
    final traficRef = database.child('/Home');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  try {
                    final trafic = <String, dynamic>{
                      'id': getNumber(),
                      'date': DateTime.now().minute
                    };
                    await traficRef
                        .child('trafic/sensor')
                        .push()
                        .set(trafic)
                        .then((value) => print("trafic is inserted "))
                        .catchError((e) {
                      // ignore: avoid_print
                      print("error" + e.toString());
                    });
                  } catch (e) {
                    // ignore: avoid_print
                    print("error" + e.toString());
                  }
                },
                child: const Text("add db ")),
            Container(
              child: Text(text),
            )
          ],
        ),
      ),
    );
  }
}
