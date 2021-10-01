import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:remember_about_pills/bloc/pill_bloc.dart';
import 'package:remember_about_pills/models/pill.dart';
import 'package:remember_about_pills/widgets/home_screen_widgets/pill_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../constraints.dart';

class HomeScreenBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: downContainerColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: BlocBuilder<PillBloc, PillState>(builder: (context, state) {
          // if (state is EmptyListState) {
          //   return EmptyListText();
          // } else if (state is FilledListState) {
          final pillsBox = Hive.box('pills');
          return ValueListenableBuilder(
              valueListenable: pillsBox.listenable(),
              builder: (ctx, index, child) {
                return ListView.builder(
                    itemCount: pillsBox.length,
                    itemBuilder: (ctx, index) {
                      final pill = pillsBox.getAt(index) as Pill;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Dismissible(
                          background: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.delete, color: Colors.red),
                                  ]),
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            // naprawić kierunek !!!!
                            if (direction == DismissDirection.endToStart) {
                              pillsBox.deleteAt(index);
                              pillsBox.compact();
                            }
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        "Are you sure you want to delete this item?"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text("Delete")),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("Cancel"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: PillTile(
                            id: pill.id,
                            title: pill.title,
                            amountPerDay: pill.amountPerDay,
                            activeWeekDays: pill.activeWeekDays,
                            pillTimeOfDay: pill.timeOfDayPills,
                          ),
                        ),
                      );
                    });
              });
        }));
  }
}
