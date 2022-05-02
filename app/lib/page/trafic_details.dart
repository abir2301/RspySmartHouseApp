import 'dart:async';

import 'package:app/DataBase/trafic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../generate.dart';

class TraficDetails extends StatefulWidget {
  const TraficDetails({Key? key}) : super(key: key);

  @override
  State<TraficDetails> createState() => _TraficDetailsState();
}

class _TraficDetailsState extends State<TraficDetails> {
  String text = "textContainer ";
  final database = FirebaseDatabase.instance.ref();
  late List<Trafic> list = [];

  @override
  void initState() {
    super.initState();

    _activateListners();
  }

  void _activateListners() async {
    late StreamSubscription<DatabaseEvent> stream;

    try {
      stream = database.child('Home/trafic').onValue.listen((event) {
        final Map<String, dynamic> data =
            event.snapshot.value as Map<String, dynamic>;

        final trafic = Trafic.fromRTDB(data);
        setState(() {
          text = trafic.tostring();
        });
      });
    } on Exception catch (e) {
      print(e.toString());
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    final traficRef = database.child('/Home');
    final traficRref = database.child('/Home/sensor/trafic');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            " sensor detection ",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            
            try {
              final trafic = <String, dynamic>{
                'id': getNumber(),
                'date': DateFormat(' kk:mm:ss – yyyy-MM-dd ')
                    .format((DateTime.now())),
                
              };
              await traficRref.push().set(trafic).then((value) {
                print("trafic is inserted ");
               
              }).catchError((e) {
                // ignore: avoid_print
                print("error" + e.toString());
              });
            } catch (e) {
              // ignore: avoid_print
              print("error" + e.toString());
            }
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: SafeArea(
          child: FirebaseAnimatedList(
              query: traficRref,
              itemBuilder: (
                BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                int index,
              ) {
                if (!snapshot.exists) {
                  return const Center(child: Text("no data yet "));
                } else {
                  Trafic trafic = Trafic(
                      id: snapshot.children.last.value.toString(),
                      date: snapshot.children.first.value.toString());

                  print("list of iteam \n ");
                  Trafic.traficList();

                  return ListTile(
                    trailing: const Icon(Icons.person),
                    title: Text(
                        "DATE  :" + snapshot.children.first.value.toString()),
                    subtitle:
                        Text(" ID :" + snapshot.children.last.value.toString()),
                  );
                }
              }),
        ));
  }
}
