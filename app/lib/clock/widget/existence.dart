import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tracking_provider.dart';

class Existance extends StatefulWidget {
  Existance({Key? key}) : super(key: key);

  @override
  State<Existance> createState() => _ExistanceState();
}

class _ExistanceState extends State<Existance> {
  IconData icon = Icons.radio_button_unchecked;

  bool exist = false;

  final database = FirebaseDatabase.instance.ref();
  String text_content = "vide ";

  @override
  void initState() {
    super.initState();
    _activateListnersExistance();
  }

  void _activateListnersExistance() async {
    late StreamSubscription<DatabaseEvent> stream;

    try {
      stream = database.child('Home/sensor/trafic').onValue.listen((event) {
        if (event.snapshot.exists) {
          setState(() {
            text_content = event.snapshot.children.last.value.toString();
          });
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TrackingProvider(),
      builder: (context, _) {
        // ignore: unused_local_variable
        final provider = Provider.of<TrackingProvider>(context, listen: false);
        return Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Text(text_content),
            ),
          ),
        );
      });
}
