import 'package:hive/hive.dart';
part 'Dice_Calc_Data.g.dart';

@HiveType(typeId: 0)
class Dice_Calc_Data extends HiveObject {

  // @HiveField(0)
  // List<List> Inst_OldRolls;
  //
  // @HiveField(1)
  // List<List> Inst_OldAns;
  //
  // @HiveField(2)
  // List<List> Inst_OldEqu;
  //
  // @HiveField(3)
  // List Inst_CurEqu;
  //
  // @HiveField(4)
  // List Inst_CurAns;
  //
  // @HiveField(5)
  // List Inst_CurRolls;
  //
  // Dice_Calc_Data(this.Inst_OldRolls, this.Inst_OldAns,this.Inst_OldEqu, this.Inst_CurEqu,this.Inst_CurAns, this.Inst_CurRolls);

  @HiveField(0)
  List<String> OldRolls;
  Dice_Calc_Data(this.OldRolls);

}