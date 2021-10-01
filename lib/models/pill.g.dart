// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PillAdapter extends TypeAdapter<Pill> {
  @override
  final int typeId = 0;

  @override
  Pill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pill(
      id: fields[0] as String,
      title: fields[1] as String,
      amountPerDay: fields[2] as int,
      activeWeekDays: (fields[3] as List)?.cast<int>(),
      timeOfDayPills: (fields[4] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pill obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amountPerDay)
      ..writeByte(3)
      ..write(obj.activeWeekDays)
      ..writeByte(4)
      ..write(obj.timeOfDayPills);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
