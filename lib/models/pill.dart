
import 'package:hive/hive.dart';
part 'pill.g.dart';

@HiveType(typeId: 0)
class Pill {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int amountPerDay;
  @HiveField(3)
  final List<int> activeWeekDays;
  @HiveField(4)
  final List<String> timeOfDayPills;

  Pill(
      {this.id,
      this.title,
      this.amountPerDay,
      this.activeWeekDays,
      this.timeOfDayPills});
}
