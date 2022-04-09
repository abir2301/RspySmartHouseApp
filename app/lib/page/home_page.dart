import 'package:app/page/SmatHouse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DataBase/db.dart';
import '../widget/change_theme_button_widget.dart';

class HomePage extends StatelessWidget {
  //User user = User("", "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //Icon(Icons.volume_up),
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
              child: const Icon(
            Icons.other_houses,
            size: 150,
          )),
          Text(
            "CONFY HOUSE",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              ShowLoginDialog(context);
            },
            child: const Text(
              "Start ",
              style: TextStyle(
                  // color: Colors.white,
                  ),
            ),
            // ignore: prefer_const_constructors

            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blue,
              elevation: 5,
            ),
          ),
        ],
      )),
    );
  }
}

// ignore: non_constant_identifier_names
void ShowLoginDialog(context) {
  BuildContext dialogContext;

  final _formKey = GlobalKey<FormState>();
  var _context = context;
  final UserNameControler = TextEditingController();
  final HousePasswordControler = TextEditingController();
  showDialog(
      useRootNavigator: true,
      context: _context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: const Text('hey! lets add some home info '),
          actions: <Widget>[
            Material(
                child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),

                      controller: UserNameControler,
                      //initialValue: "User1",
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if ((value!.isEmpty)) {
                          return ("password is incorrect ");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      autocorrect: true,

                      controller: HousePasswordControler,
                      //initialValue: "User1",
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if ((value!.isEmpty) && (value != "root")) {
                          return ("value should not be empty ");
                        }
                      },
                    ),
                  ),
                ],
              ),
            )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close')),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // ignore: unnecessary_new, unused_local_variable
                  // User user = new User(
                  //     UserNameControler.text, HousePasswordControler.text);
                  // //User.users.add(user);
                  // UserName = UserNameControler.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SmartHome()),
                  );
                }
              },
              child: const Text('submit'),
            )
          ],
        );
      });
}