import 'package:flutter/material.dart';
import 'package:remember_about_pills/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RememberAboutPills());
}

class RememberAboutPills extends StatefulWidget {
  @override
  _RememberAboutPillsState createState() => _RememberAboutPillsState();
}

class _RememberAboutPillsState extends State<RememberAboutPills> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remember about pills !',
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          accentColor: Color(0xFF1E9F84),
          buttonColor: Color(0xFFEFEFEF),
          cardColor: Color(0xFFF2F9F7),
          canvasColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.white),
      home: HomeScreen(),
      routes: {},
    );
  }
}
