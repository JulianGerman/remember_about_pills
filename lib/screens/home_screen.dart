import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/home_screen_bottom_view.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/home_screen_top_view.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/modal_bottom_sheet.dart';
import '../other/constraints.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var deviceHeigth =
        mediaQuery.height; // do zmiany bo trzeba dodać APP BAR i NOTCH
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, elevation: 0.0, actions: []),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: HomeScreenTopView(deviceHeigth: deviceHeigth),
            flex: 1,
          ),
          Flexible(
            child: HomeScreenBottomView(),
            flex: 3,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              backgroundColor: downContainerColor,
              context: context,
              isScrollControlled: true,
              builder: (context) => ModalBottomSheet(
                    title: 'Add your pill',
                  ));
        },
      ),
    );
  }
}
