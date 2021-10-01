import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'custom_button.dart';

class HomeScreenTopView extends StatelessWidget {
  final double deviceHeigth;

  const HomeScreenTopView({Key key, this.deviceHeigth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBox = Hive.box('user');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ValueListenableBuilder(
            valueListenable: userBox.listenable(),
            builder: (context, index, child) {
              final userName = userBox.getAt(0);
              return Text('Hello, $userName !',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ));
            },
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                final pillsBox = Hive.box('pills');
                pillsBox.clear();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.star,
              ),
              onPressed: () {
                userBox.clear();
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              bgColor: Colors.grey,
              textColor: Colors.black,
              title: 'Button',
              onTap: () {
                print('Button1');
              },
            ),
            CustomButton(
              bgColor: Theme.of(context).accentColor,
              textColor: Colors.white,
              title: 'Button',
              onTap: () {
                print('Button2');
              },
            )
          ],
        ),
      ],
    );
  }
}
