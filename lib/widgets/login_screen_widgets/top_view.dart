import 'package:flutter/material.dart';

class TopView extends StatelessWidget {
  const TopView({
    Key key,
    @required this.deviceHeigth,
  }) : super(key: key);

  final double deviceHeigth;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 30.0),
        child: Text(
          'Say your name!',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        height: deviceHeigth * 0.1,
      ),
    ]);
  }
}
