// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Dice_Calc_Data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiceCalcDataAdapter extends TypeAdapter<Dice_Calc_Data> {
  @override
  final int typeId = 0;

  @override
  Dice_Calc_Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dice_Calc_Data(
      (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Dice_Calc_Data obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.OldRolls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiceCalcDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
