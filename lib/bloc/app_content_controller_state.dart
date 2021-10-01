part of 'app_content_controller_bloc.dart';

@immutable
abstract class AppContentControllerState {}

class AppContentBeforeLoggedInState extends AppContentControllerState {}

class AppContentAfterLoggedInState extends AppContentControllerState {}
