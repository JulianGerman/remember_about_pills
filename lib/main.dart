import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:remember_about_pills/bloc/app_content_controller_bloc.dart';
import 'package:remember_about_pills/screens/home_screen.dart';
import 'package:remember_about_pills/screens/login_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:remember_about_pills/widgets/home_screen_widgets/bloc/counter_bloc.dart';

import 'bloc/pill_bloc.dart';
import 'models/pill.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(PillAdapter());
  await Hive.openBox('user');

  runApp(RememberAboutPills());
}

class RememberAboutPills extends StatefulWidget {
  @override
  _RememberAboutPillsState createState() => _RememberAboutPillsState();
}

class _RememberAboutPillsState extends State<RememberAboutPills> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppContentControllerBloc>(
              create: (BuildContext context) => AppContentControllerBloc()),
          BlocProvider<PillBloc>(
            create: (context) => PillBloc(),
          ),
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Remember about pills !',
          theme: ThemeData(
              backgroundColor: Colors.white,
              primaryColor: Colors.white,
              accentColor: Color(0xFF1E9F84),
              buttonColor: Color(0xFFEFEFEF),
              cardColor: Color(0xFFF2F9F7),
              canvasColor: Colors.transparent,
              scaffoldBackgroundColor: Colors.white),
          home:
              BlocBuilder<AppContentControllerBloc, AppContentControllerState>(
            builder: (context, state) {
              //Check if user is already logged in
              final userBox = Hive.box('user');
              if (userBox.containsKey(1) ||
                  state is AppContentAfterLoggedInState) {
                return FutureBuilder(
                    future: Hive.openBox('pills'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return HomeScreen();
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Scaffold(
                            body: Center(child: CircularProgressIndicator()));
                      }
                    });
              }
              if (state is AppContentBeforeLoggedInState) {
                return FutureBuilder(
                  future: Hive.openBox('user'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return LoginScreen();
                    }
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Scaffold(
                          body: Center(child: CircularProgressIndicator()));
                    }
                  },
                );
              }
            },
          ),
          routes: {},
        ));
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
