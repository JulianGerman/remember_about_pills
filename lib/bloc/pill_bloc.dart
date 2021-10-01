import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:remember_about_pills/models/pill.dart';

part 'pill_event.dart';
part 'pill_state.dart';

class PillBloc extends Bloc<PillEvent, PillState> {
  PillBloc() : super(EmptyListState());

  @override
  Stream<PillState> mapEventToState(
    PillEvent event,
  ) async* {
    if (event is SavePillData) {
      yield FilledListState();
    }
  }
}
