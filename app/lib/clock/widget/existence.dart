import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tracking_provider.dart';

class Existance extends StatefulWidget {
  Existance({Key? key}) : super(key: key);

  @override
  State<Existance> createState() => _ExistanceState();
}

class _ExistanceState extends State<Existance> {
  IconData icon = Icons.radio_button_unchecked;

  bool exist = false;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TrackingProvider(),
      builder: (context, _) {
        final provider = Provider.of<TrackingProvider>(context, listen: false);
        return Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                provider.changeExist();
              });
            },
            icon: Icon(
              provider.icon,
              size: 30,
            ),
          ),
        );
      });
}
