part of 'pill_bloc.dart';

@immutable
abstract class PillEvent {}

final pillBox = Hive.box('pills');

class SavePillData extends PillEvent {
  void saveForm(Pill pill) {
    pillBox.add(pill);
  }
}

class RemovePillData extends PillEvent {
  final pillBox = Hive.box('pills');
  void removePillData(index) {
    pillBox.deleteAt(index);
  }
}
