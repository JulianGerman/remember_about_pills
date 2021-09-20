import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_content_controller_event.dart';
part 'app_content_controller_state.dart';

class AppContentControllerBloc
    extends Bloc<AppContentControllerEvent, AppContentControllerState> {
  AppContentControllerBloc() : super(AppContentBeforeLoggedIn());
  @override
  Stream<AppContentControllerState> mapEventToState(
    AppContentControllerEvent event,
  ) async* {
    if (event is SaveLoginDataEvent) {
      yield AppContentAfterLoggedIn();
    }
  }
}
