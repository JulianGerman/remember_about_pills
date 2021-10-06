import 'package:flutter/material.dart';

class EmptyListText extends StatelessWidget {
  const EmptyListText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Empty list',
      style: TextStyle(
          fontSize: 40, color: Colors.black45, fontWeight: FontWeight.bold),
    ));
  }
}
