import 'package:app/DataBase/user.dart';
import 'package:app/widget/lamps_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DataBase/lamp.dart';
import '../provider/lamp_provider.dart';

class HomeModel extends StatelessWidget {
  HomeModel({
    Key? key,
  });
  // ignore: unused_field
  final GlobalKey _widgetKey = GlobalKey();
  @override
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LampsProvider(),
      builder: (context, _) {
        return SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          MediaQuery.of(context).size.height.toDouble() * 0.001,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width.toDouble() *
                              0.75),
                      child: CircleAvatar(
                        backgroundColor: Colors.purple.shade200,
                        child: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width.toDouble() *
                              0.75),
                      child: IconButton(
                          onPressed: () {
                            ShowAddLampDialog(context);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.shortestSide,
                        child: LampsListWidget(),
                      ),
                    ),
                  ]),
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
          content: const Text("Add New lamp "),
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
                              label: Text(" Lamp Name "),
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
                              label: Text("lamp Id "),
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
