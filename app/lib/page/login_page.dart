// ignore_for_file: invalid_return_type_for_catch_error

import 'package:app/page/smart_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/change_theme_button_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //User? user = FirebaseAuth.instance.currentUser;
  }

  // ignore: non_constant_identifier_names
  void ShowLoginDialog(context) {
    //User? user = FirebaseAuth.instance.currentUser;

    final _formKey = GlobalKey<FormState>();
    var _context = context;
    // ignore: non_constant_identifier_names
    final EmailControler = TextEditingController();
    // ignore: non_constant_identifier_names
    final PasswordControler = TextEditingController();

    showDialog(
        useRootNavigator: true,
        context: _context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              'Sign In',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: <Widget>[
              Expanded(
                child: Material(
                    child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            // labelText: "Email",
                            label: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          controller: EmailControler,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if ((value!.isEmpty)) {
                              return ("email format  is incorrect ");
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            //errorText: "nnn",
                            // labelText: "password ",
                            label: Icon(Icons.password),
                            border: OutlineInputBorder(),
                          ),
                          autocorrect: true,
                          obscureText: true,

                          controller: PasswordControler,
                          //initialValue: "User1",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if ((value!.isEmpty) || (value.length < 6)) {
                              return ("Password  should contain at least  6 charecters ");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    backgroundColor: Colors.pink,
                    // elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.button,
                  )),
              TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    backgroundColor: Colors.pink,
                    // elevation: 5,
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: EmailControler.text.trim(),
                              password: PasswordControler.text.trim())
                          .then((value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SmartHome()),
                                )
                              });
                    } on FirebaseAuthException catch (e) {
                      setState(() {});
                      print("exeption === ${e.message}");
                    }
                  },
                  child: Text(
                    'submit',
                    style: Theme.of(context).textTheme.button,
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          //Icon(Icons.volume_up),
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                "COMFY HOUSE",
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
                  ),
                  // ignore: prefer_const_constructors
                  style: Theme.of(context).textButtonTheme.style),
            ],
          ),
        ),
      ),
    );
  }
}
