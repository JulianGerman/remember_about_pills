import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_content_controller_event.dart';
part 'app_content_controller_state.dart';

class AppContentControllerBloc extends Bloc<AppContentControllerEvent, AppContentControllerState> {
  AppContentControllerBloc() : super(AppContentControllerInitial());

  @override
  Stream<AppContentControllerState> mapEventToState(
    AppContentControllerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
