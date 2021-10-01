part of 'app_content_controller_bloc.dart';

@immutable
abstract class AppContentControllerEvent {}

class SaveLoginDataEvent extends AppContentControllerEvent {
  final String name;
  SaveLoginDataEvent({this.name});

  final userBox = Hive.box('user');
  void saveLogin(String name) {
    userBox.put(1, name);
    print(name);
  }
}
