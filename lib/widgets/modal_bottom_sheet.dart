import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  int _amountPerDay = 1;
  final _pillTitle = TextEditingController();
  final weekDaySelectorValues = List.filled(7, false);
  List<int> weekDaySelectorInt = [];
  @override
  Widget build(BuildContext context) {
    // var pillProvider = Provider.of<PillsProvider>(context);
    void saveForm() {
      // var pillTile = pillProvider.addPill(DateTime.now().toString(),
      // _pillTitle.text, _amountPerDay, weekDaySelectorInt);
      Navigator.of(context).pop();
      // final box = Boxes.getPills();
      // box.add(pillTile);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 70),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: 'Pill Name',
                  labelStyle: TextStyle(color: Colors.black)),
              controller: _pillTitle,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _amountPerDay--;
                        });
                      }),
                  Text(
                    _amountPerDay.toString(),
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _amountPerDay++;
                        });
                      }),
                ],
              ),
            ),
            WeekdaySelector(
                selectedFillColor: Colors.black,
                onChanged: (v) {
                  setState(() {
                    print(v);
                    print(weekDaySelectorValues);
                    weekDaySelectorValues[v % 7] =
                        !weekDaySelectorValues[v % 7];
                  });
                  if (weekDaySelectorValues.elementAt(v) == true) {
                    weekDaySelectorInt.add(v);
                  }
                },
                values: weekDaySelectorValues),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: TextButton(
                  onPressed: () {
                    saveForm();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
