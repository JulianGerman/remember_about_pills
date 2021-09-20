import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remember_about_pills/widgets/custom_button.dart';
import 'package:remember_about_pills/widgets/modal_bottom_sheet.dart';
import '../constraints.dart';

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
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0.0, actions: [
        PopupMenuButton(
            onSelected: (val) {},
            icon: Icon(Icons.more_horiz, size: 32),
            itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text('Show favorites'),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Show all'),
                    value: 1,
                  )
                ]),
      ]),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: deviceHeigth * 0.25,
              color: Theme.of(context).primaryColor,
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  radius: deviceHeigth * 0.05,
                  child: Text('PHOTO'),
                ),
                Divider(
                  indent: mediaQuery.width * 0.3,
                  endIndent: mediaQuery.width * 0.3,
                ),
                Text('Name Surname'),
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
                )
              ]),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: downContainerColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  width: double.infinity,
                  child:
                      // child: pillData.items.isEmpty
                      Center(
                          child: Text(
                    'Empty list',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ))
                  // : buildListView(pillData),
                  ),
            )
          ],
        ),
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
              builder: (context) => ModalBottomSheet());
        },
      ),
    );

// Widget buildListView(var pillData) {
//   return Column(children: [
//     Text('Your pills'),
//     ValueListenableBuilder<Box<Pill>>(
//         valueListenable: Boxes.getPills().listenable(),
//         builder: (ctx, box, _) {
//           final pills = box.values.toList().cast<Pill>();

//           // if (pills.isEmpty) {
//           //   return Text('empty');
//           // } else {
//           //   return Text(pills[0].title);
//           // }
//           // return Expanded(
//           //     child: ListView.builder(
//           //         itemCount: pillData.items.length,
//           //         itemBuilder: (ctx, i) {
//           //           var pillList = pillData.items[i];

//           //           // return PillTile(
//           //           //     title: pillList.title,
//           //           //     id: pillList.id,
//           //           //     amountPerDay: pillList.amountPerDay,
//           //           //     activeWeekDays: pillList.activeWeekDays);
//           //         }));
//         })
//   ]);
// }
  }
}
