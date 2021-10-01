import 'package:flutter/material.dart';

class PillTile extends StatelessWidget {
  final String id;
  final String title;
  final int amountPerDay;
  final List<int> activeWeekDays;
  final List<String> pillTimeOfDay;
  PillTile(
      {@required this.id,
      @required this.title,
      @required this.amountPerDay,
      @required this.activeWeekDays,
      @required this.pillTimeOfDay});

  List<String> dayNames = [];
  List<String> getDayNames() {
    activeWeekDays.sort();
    for (var item in activeWeekDays) {
      if (item == 1) {
        dayNames.add('Monday');
      }
      if (item == 2) {
        dayNames.add('Tuesday');
      }
      if (item == 3) {
        dayNames.add('Wednesday');
      }
      if (item == 4) {
        dayNames.add('Thursday');
      }
      if (item == 5) {
        dayNames.add('Friday');
      }
      if (item == 6) {
        dayNames.add('Saturday');
      }
      if (item == 7) {
        dayNames.add('Sunday');
      }
    }
    return dayNames;
  }

  @override
  Widget build(BuildContext context) {
    getDayNames();
    return Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  )),
              Text('$amountPerDay / day',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic))
            ],
          ),
        ),
        Container(
          height: 20,
          color: Colors.white,
          child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dayNames.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [FittedBox(child: Text(dayNames[i]))],
                    ),
                  );
                }),
          ),
        ),
        Container(
          height: 20,
          color: Colors.white,
          child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: pillTimeOfDay.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FittedBox(
                            child: Text(
                                pillTimeOfDay[i].split("(")[1].split(")")[0]))
                      ],
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}
