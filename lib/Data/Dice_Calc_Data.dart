import 'package:hive/hive.dart';
part 'Dice_Calc_Data.g.dart';

@HiveType(typeId: 0)
class Dice_Calc_Data extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  Dice_Calc_Data(this.name, this.age);
}