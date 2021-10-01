import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final Color bgColor;
  final String title;
  final Color textColor;

  const CustomButton(
      {Key key, this.onTap, this.bgColor, this.title, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
