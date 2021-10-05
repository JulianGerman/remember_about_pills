import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_about_pills/bloc/pill_bloc.dart';
import 'package:remember_about_pills/models/pill.dart';
import 'package:weekday_selector/weekday_selector.dart';

import 'bloc/counter_bloc.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  int _amountPerDay = 1;
  String _pillTitle;
  final weekDaySelectorValues = List.filled(7, false);
  List<int> weekDaySelectorInt = [];
  List<String> _timeOfDayPills = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 70),
      child: Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                onSaved: (newValue) => _pillTitle = newValue,
                decoration: InputDecoration(
                    labelText: 'Pill Name',
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (_amountPerDay > 0) {
                            BlocProvider.of<CounterBloc>(context)
                                .add(CounterDecrementEvent());
                          }
                        }),
                    BlocBuilder<CounterBloc, int>(
                      builder: (context, state) {
                        _amountPerDay = state;
                        return Text(state.toString(),
                            style: TextStyle(
                              fontSize: 40,
                            ));
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (_amountPerDay < 10) {
                            BlocProvider.of<CounterBloc>(context)
                                .add(CounterIncrementEvent());
                            ;
                          }
                        }),
                  ],
                ),
              ),
              WeekdaySelector(
                  selectedFillColor: Colors.black,
                  onChanged: (v) {
                    setState(() {
                      weekDaySelectorValues[v % 7] =
                          !weekDaySelectorValues[v % 7];
                      if (weekDaySelectorValues.elementAt(v) == true) {
                        weekDaySelectorInt.add(v);
                      }
                    });
                  },
                  values: weekDaySelectorValues),
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: state,
                        itemBuilder: (ctx, index) {
                          return TextButton(
                              onPressed: () async {
                                final TimeOfDay timeofPill =
                                    await showTimePicker(
                                        builder: (BuildContext context,
                                            Widget child) {
                                          return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(
                                                      alwaysUse24HourFormat:
                                                          true),
                                              child: child);
                                        },
                                        context: context,
                                        initialEntryMode:
                                            TimePickerEntryMode.input,
                                        initialTime: TimeOfDay(
                                            hour: int.parse(
                                                getHour(index).split(":")[0]),
                                            minute: int.parse(
                                                getHour(index).split(":")[1])));
                                if (timeofPill != null) {
                                  setState(() {
                                    _timeOfDayPills.add(timeofPill.toString());
                                    print(_timeOfDayPills);
                                  });
                                }
                              },
                              child: Text(
                                getHour(index),
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context).accentColor)));
                        }),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: TextButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      final newPill = Pill(
                          id: DateTime.now().toString(),
                          title: _pillTitle,
                          amountPerDay: _amountPerDay,
                          activeWeekDays: weekDaySelectorInt,
                          timeOfDayPills: _timeOfDayPills);
                      BlocProvider.of<PillBloc>(context)
                          .add(SavePillData()..saveForm(newPill));
                      Navigator.of(context).pop();
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
      ),
    );
  }
}

getHour(int index) {
  String hour;

  if (index == 0) {
    hour = '7:00';
  }
  if (index == 1) {
    hour = '9:00';
  }
  if (index == 2) {
    hour = '11:00';
  }
  if (index == 3) {
    hour = '13:00';
  }
  if (index == 4) {
    hour = '15:00';
  }
  if (index == 5) {
    hour = '17:00';
  }
  if (index == 6) {
    hour = '19:00';
  }
  if (index == 7) {
    hour = '21:00';
  }
  if (index == 8) {
    hour = '23:00';
  }
  if (index == 9) {
    hour = '00:00';
  }
  return hour;
}
