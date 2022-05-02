import 'package:app/page/trafic_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../clock/controller/clock_controller.dart';
import '../clock/widget/clock.dart';
import '../clock/widget/existence.dart';

class TrackingModel extends GetView<Controller> {
  IconData icon = Icons.radio_button_unchecked;
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("date :",
                            style: Theme.of(context).textTheme.headline4

                            //),

                            ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                            DateFormat("d - MMM - y")
                                .format(controller.dateTime.value),
                            style: Theme.of(context).textTheme.headline4),
                      ],
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Existance(),
          ),
          Clock(),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TraficDetails()),
                  );
                },
                child: const Text(
                  "Detail",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
