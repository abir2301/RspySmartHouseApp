import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../clock/controller/clock_controller.dart';
import '../clock/widget/clock.dart';
import '../clock/widget/existence.dart';

class TrackingModel extends GetView<Controller> {
  IconData icon = Icons.radio_button_unchecked;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("date :",
                            style: GoogleFonts.poppins(
                                color: const Color(0xffC9C9C9), fontSize: 12)

                            //),

                            ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                            DateFormat("d - MMM - y")
                                .format(controller.dateTime.value),
                            style: GoogleFonts.poppins(
                                color: const Color(0xffC9C9C9), fontSize: 21)),
                      ],
                    )
                  ],
                ),
              )),
          const SizedBox(
            height: 50,
          ),

          Existance(),

          Clock(),
          const SizedBox(
            height: 10,
          ),

          // Padding(
          //   padding: const EdgeInsets.only(left: 80),
          //   child: Row(
          //     // ignore: prefer_const_literals_to_create_immutables
          //     children: [
          //       const Icon(
          //         Icons.accessibility,
          //         size: 50,
          //       ),
          //       const SizedBox(
          //         width: 8,
          //       ),
          //       Icon(
          //         exist
          //             ? Icons.radio_button_checked
          //             : Icons.radio_button_unchecked,
          //         size: 30,
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
