import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:remember_about_pills/bloc/app_content_controller_bloc.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/custom_button.dart';
import 'package:remember_about_pills/widgets/login_screen_widgets/bottom_view.dart';
import 'package:remember_about_pills/widgets/login_screen_widgets/top_view.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userBox = Hive.box('user');

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var deviceHeigth =
        mediaQuery.height; // do zmiany bo trzeba dodać APP BAR i NOTCH

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopView(deviceHeigth: deviceHeigth),
          BottomView(
            deviceHeigth: deviceHeigth,
          )
        ],
      ),
    );
  }
}
