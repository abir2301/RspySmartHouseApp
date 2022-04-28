import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tracking_provider.dart';

class Existance extends StatelessWidget {
  IconData icon = Icons.radio_button_unchecked;

  bool exist = false;
  Existance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => TrackingProvider(),
      builder: (context, _) {
        final provider = Provider.of<TrackingProvider>(context, listen: false);
        return Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      child: const Text("change "),
                      onPressed: () {
                        provider.exist = !provider.exist;
                        print("exist =" + provider.exist.toString());
                      })),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    provider.changeExist();
                  },
                  icon: Icon(
                    provider.icon,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        );
      });
}
