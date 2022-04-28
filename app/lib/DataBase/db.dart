import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
late String UserName = "user";

class User {
  // ignore: unused_field
  late String _username;
 late  String _password;
  static List<User> users = [
    User("abir", "root"),
    User("hammadi ", "root"),
    User("zeyneb ", "root"),
    User("ritej ", "root"),
  ];
  

   
    User(username, password) {
    _username = username;
    _password = password;
    User.users.add(this);
    //User.noun = users[users.length - 1]._username;
  }
 
  static String lastuser() {
    return users[users.length]._username;
  }

  void affiche() {
    print("user =${this._username} password =${this._password} ");
  }

  // ignore: non_constant_identifier_names
  String setname(){
    return this._username ;
  }
  get username => _username;
  get password => _password;
  void addUser(User user) {
    if (user._password == "root") {
      users.add(user);
    }
  }
}
