import 'package:app/DataBase/lamp.dart';
import 'package:app/provider/lamp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/lampwidget.dart';

class LampsListWidget extends StatelessWidget {
  // const LampsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LampsProvider>(context);
    final lapms = provider.lamps;
    return lapms.isEmpty
        ? const Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            separatorBuilder: (context, index) => Container(height: 10),
            itemCount: lapms.length,
            itemBuilder: (context, index) {
              final lamp = lapms[index];

              return LampWidget(lamp: lamp);
            },
          );
  }
}
