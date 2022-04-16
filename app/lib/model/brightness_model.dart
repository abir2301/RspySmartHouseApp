import 'package:app/DataBase/db.dart';
import 'package:app/widget/lamps_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DataBase/lamp.dart';
import '../provider/lamp_provider.dart';

class HomeModel extends StatelessWidget {
  HomeModel({Key? key}) : super(key: key);
  // ignore: unused_field
  final GlobalKey _widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LampsProvider(),
      builder: (context, _) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(//avatar user
                            children: [
                          CircleAvatar(
                            backgroundColor: Colors.purple.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(UserName),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.shortestSide,
                        child: LampsListWidget(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 250, right: 20),
                        child: FloatingActionButton(
                            isExtended: true,
                            child: const Icon(Icons.add),
                            onPressed: () {
                              print("pressed");
                              ShowAddLampDialog(context);
                            }),
                      )
                    ],
                  ))
            ],
          ),
        );
      });
}

// ignore: non_constant_identifier_names
void ShowAddLampDialog(context) {
  final provider = Provider.of<LampsProvider>(context, listen: false);
  var NameBrightControler = TextEditingController();
  var BrightIdControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: const Text("Add new lamp "),
          actions: <Widget>[
            Material(
              child: Form(
                  key: _formKey,
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: NameBrightControler,
                            validator: (value) {
                              if (value!.isEmpty)
                                return ('value should not be emRpty ');
                            },
                            decoration: const InputDecoration(
                              label: Text("bright name "),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: BrightIdControler,
                            validator: (value) {
                              if (provider.lampId.contains(value))
                                return ('id exist  ');
                            },
                            decoration: const InputDecoration(
                              label: Text("bright name "),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    print(NameBrightControler.text +
                                        "" +
                                        BrightIdControler.text);
                                    if (_formKey.currentState!.validate()) {
                                      var lamp = Lamp(
                                          name: NameBrightControler.text,
                                          id: BrightIdControler.text);
                                      provider.addLamp(lamp);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text("Save")),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Skip")),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        );
      });
}
