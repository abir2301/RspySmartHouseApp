import 'package:app/model/Statistics.dart';
import 'package:app/model/Tracking_Model.dart';
import 'package:app/provider/lamp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/brightness_model.dart';
import '../widget/change_theme_button_widget.dart';

class SmartHome extends StatefulWidget {
  const SmartHome({Key? key}) : super(key: key);

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  int _selectedIndex = 0;
  List screen_model = [HomeModel(), TrackingModel(), Statistics()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LampsProvider(),
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 0,
                ),
                child: PopupMenuButton(
                    elevation: 5,
                    child: const Icon(Icons.settings),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                const Text("theme"),
                                ChangeThemeButtonWidget(),
                              ],
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                const Text("FR"),
                                ChangeThemeButtonWidget(),
                                const Text("EN"),
                              ],
                            ),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Text("help"),
                                  onTap: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.mail),
                              ],
                            ),
                            value: 2,
                          )
                        ]),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'tracking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.percent),
                label: 'statsitics',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
          body: screen_model[_selectedIndex]));
}