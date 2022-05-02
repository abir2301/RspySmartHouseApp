import 'package:app/DataBase/trafic.dart';
import 'package:app/DataBase/user.dart';
import 'package:app/model/trafic_graphic_model.dart';
import 'package:app/model/Tracking_Model.dart';
import 'package:app/provider/lamp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/home_model.dart';
import '../widget/change_theme_button_widget.dart';

class SmartHome extends StatefulWidget {
  const SmartHome({Key? key}) : super(key: key);

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  int _selectedIndex = 0;
  // ignore: non_constant_identifier_names, prefer_const_constructors
  List screen_model = [HomeModel(), TrackingModel(), ChartDetails()];

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
                                const Text("Theme"),
                                ChangeThemeButtonWidget(),
                              ],
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Text("Help"),
                                  onTap: () {},
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.mail,
                                  color: Theme.of(context).primaryColor,
                                ),
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
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  //color: Theme.of(context).secondaryHeaderColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'trafic',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'charts',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body: screen_model[_selectedIndex]));
}
