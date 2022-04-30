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
          title: const Text(" sensor detection "),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // var format = DateFormat.yMd('ar');
            // var dateString = format.format(DateTime.now());
            try {
              final trafic = <String, dynamic>{
                'id': getNumber(),
                'date': DateFormat(' kk:mm:ss – yyyy-MM-dd ')
                    .format((DateTime.now())),
                //DateTime.parse('2021-11-01 20:18').toLocal().toString()
              };
              await traficRref.push().set(trafic).then((value) {
                print("trafic is inserted ");
                //trafic.toString();
              }).catchError((e) {
                // ignore: avoid_print
                print("error" + e.toString());
              });
            } catch (e) {
              // ignore: avoid_print
              print("error" + e.toString());
            }
          },
          child: const Text('add'),
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
  // @override
  // void deactivate(){
  //   stream.cancel() as  StreamSubscription ;
  // super.deactivate() ;

  // }

}

 // var format = DateFormat.yMd('ar');
                      // var dateString = format.format(DateTime.now());
                      // try {
                      //   final lampdb = <String, dynamic>{
                      //     'id': lamp.id.toString(),
                      //     'name': lamp.name.toString()

                      //     //DateTime.parse('2021-11-01 20:18').toLocal().toString()
                      //   };
                      //   await LampRef.push().set(lampdb).then((value) {
                      //     print("trafic is inserted ");
                      //     //trafic.toString();
                      //   }).catchError((e) {
                      //     // ignore: avoid_print
                      //     print("error" + e.toString());
                      //   });
                      // } catch (e) {
                      //   // ignore: avoid_print
                      //   print("error" + e.toString());
                      // }