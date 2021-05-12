import 'package:flutter/material.dart';
import 'package:dicecalc_diceulator/Functions/Calc_Functions.dart';
import 'package:dicecalc_diceulator/Data/globals.dart' as globals;


class Dice_Calc_Page extends StatefulWidget {
  Dice_Calc_Page({Key key, this.Calc_Inst_Name}) : super(key: key);

  final String Calc_Inst_Name;

  @override
  _Dice_Calc_PageState createState() => _Dice_Calc_PageState();
}

class _Dice_Calc_PageState extends State<Dice_Calc_Page> {
  String CurEqu = '';
  List<String> OldEqu = [];
  String CurAns = '';
  List<String> OldAns= [];

  Widget PastRolls_Card(){
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.07,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CurEqu ,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(globals.CurRolls,style: TextStyle(fontWeight: FontWeight.bold),),
          Text("${CurAns}",style: TextStyle(fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.87,
                height: MediaQuery.of(context).size.height * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    //                  Current Answer with the rolls made
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(30.0),
                                ),
                              ),
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  PastRolls_Card(),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.bottomRight,
                              //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
                                      alignment: Alignment.bottomRight,
                                      child: Text(globals.CurRolls, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                                      alignment: Alignment.bottomRight,
                                      child: Text(CurAns, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //                    Current Equation
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerRight,
                        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                            alignment: Alignment.bottomRight,
                            child: Text(CurEqu, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex:6,
                      child: Container(
                        decoration: BoxDecoration(
                         // border: Border(top: BorderSide(color: Colors.black),),
                        ),
                       // color: Colors.green,
                        child: Container(
                          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('7'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('8'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('9'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('C'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('4'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('5'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('6'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('-'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('1'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('2'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('3'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('+'),
                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('0'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Calc_Key('d'),
                                      SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                          child: Center(
                                            child: Text('=', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                            ),
                                          ),
                                          onPressed: (){
                                            if(CurEqu.endsWith(' ') || CurEqu.endsWith('d'))
                                            {
                                              // Do Nothing
                                            }else
                                            {
                                              //                                Sets Current Equation stuff and updates 'old' lists
                                              setState(() {
                                                CurAns = Equ_Solver(CurEqu).toString();
                                                OldAns.insert(0, CurAns);
                                                if(OldAns.length > globals.OldListSize)
                                                  {
                                                    OldAns.removeLast();
                                                  }
                                                OldEqu.insert(0, CurEqu);
                                                if(OldEqu.length > globals.OldListSize)
                                                {
                                                  OldEqu.removeLast();
                                                }
                                                //print('${OldEqu}');
                                                //print('${globals.OldRolls}');
                                                //print('${OldAns}');
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(50),
                                            right: Radius.circular(50),
                                          ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              //TODO: Instances of Calc info
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                   // border: Border(left: BorderSide(color: Colors.black),),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                      Inst_Button(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Instance Button
  Widget Inst_Button(){
    return Expanded(
      flex: 20,
      child: Container(
        child: SizedBox.expand(
          child: GestureDetector(
            child: FractionallySizedBox(
                widthFactor: .9,
                heightFactor: .8,
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50.0),
                  ),
                ),
                ),
            ),
          ),
        ),
        ),
    );
  }

  //  Calculator Keys
  Widget Calc_Key(String Action){
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          //elevation: 20
          //side: BorderSide(color: Colors.black, width: 1),
        ),
        child: Center(
          child: Text(Action, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        onPressed: (){
          //                         Clear
          if(Action == 'C')
          {
            setState(() {
              CurEqu = '';
              CurAns = '';
              globals.CurRolls = '';
            });
            //                     Process Current Equation
          }else if(Action == '='){
            if(CurEqu.endsWith(' ') || CurEqu.endsWith('d'))
            {
              // Do Nothing
            }else
            {
              setState(() {
                CurAns = Equ_Solver(CurEqu).toString();
              });
            }

            //                         Enter pressed button into Current Equation String 'CurEqu'
          }else
          {
            setState((){
              if(Action == '+')
              {
                if(CurEqu.endsWith(' ') || CurEqu.endsWith('d'))
                {
                  //DO Nothing
                }else{
                  CurEqu = CurEqu + ' + ';
                }
              }else if(Action == '-')
              {
                if(CurEqu.endsWith(' ') || CurEqu.endsWith('d'))
                {
                  //DO Nothing
                }else{
                  CurEqu = CurEqu + ' - ';
                }
              }else if(Action == 'd' && (CurEqu.endsWith('d') || CurEqu.split(' ').last.contains('d')))
              {
                //Do Nothing
              }else
              {
                if(CurEqu.split(' ').last.split('d').last.length > 3 && Action != 'd')
                {
                  // DO Nothing
                }else{
                  if(CurEqu.endsWith('d') && Action == '0')
                  {
                    // DO Nothing
                  }else{
                    CurEqu = CurEqu + Action;
                  }
                }
              }

            });
          }
          print(CurEqu);
        },
      ),
    );
  }

}