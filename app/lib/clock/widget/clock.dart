import 'dart:math';

import 'package:app/clock/controller/clock_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../painter/clock_painter.dart';

// ignore: use_key_in_widget_constructors
class Clock extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: Obx(
          () => AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff141414),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 64,
                        color: Color(0xFF364564).withOpacity(0.14))
                  ]),
              child: Transform.rotate(
                  angle: -pi / 2,
                  child: CustomPaint(
                      painter: ClockPainter(controller.dateTime.value))),
            ),
          ),
        ));
  }
}
