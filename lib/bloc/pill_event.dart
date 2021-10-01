part of 'pill_bloc.dart';

@immutable
abstract class PillEvent {}

class SavePillData extends PillEvent {
  final pillBox = Hive.box('pills');
  void saveForm(Pill pill) {
    pillBox.add(pill);
  }
}
