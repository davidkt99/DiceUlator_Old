import 'dart:math';
import 'dart:core';
import 'package:dicecalc_diceulator/Data/globals.dart' as globals;



int Equ_Solver(String Equ){
  int answer = 0;
  var sol_equ = "";
  var working = Equ.split(' ');
  var calc_str;
  var to_add = "";

  for(var i  = 0;i < working.length;i++)
  {
    //print(working[i] + working[i].contains('d').toString());
    if(working[i].contains('d'))
    {

      to_add = "";
      //Allows for dice rolls starting with d to equal 1
      if(working[i].startsWith('d'))
        {
          working[i] = '1'+working[i];
        }
      print("working[" + i.toString() + "]: " + working[i]);
      calc_str = working[i].split('d');
      print(calc_str);
      for(int j = 0;j < int.parse(calc_str[0]);j++)
      {
        to_add += Dice_Randomizer(int.parse(calc_str[1])).toString();
        if(j < (int.parse(calc_str[0]))- 1)
        {
          to_add += "+";
        }
      }
      working[i] = to_add;
    }
    sol_equ += working[i];
  }
  print("equ: " + Equ);
  print("sol_equ: " + sol_equ);

  globals.CurRolls = sol_equ;
  globals.OldRolls.insert(0, sol_equ);
  if(globals.OldRolls.length > globals.OldListSize)
    {
      globals.OldRolls.removeLast();
    }

  working = sol_equ.split('+');
  for(var i = 0;i < working.length;i++)
  {
    if(working[i].contains('-'))
    {
      calc_str = working[i].split('-');
      for(var j = 0;j < calc_str.length;j++)
      {
        if(j == 0)
        {
          answer += int.parse(calc_str[j]);
        }else
        {
          answer -= int.parse(calc_str[j]);
        }
      }
    }else
    {
      answer += int.parse(working[i]);
    }
  }
  //print(answer.toString());
  return answer;
}

//  xdy = x * random number between 1 and y ------- outputs said number
int Dice_Randomizer(var y){
  var rand = new Random();
  var dice_roll = 0;
  dice_roll = rand.nextInt(10000) % y + 1;
  //print(dice_roll);
  return dice_roll;
}
