import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dicecalc_diceulator/Functions/Calc_Functions.dart';
import 'package:dicecalc_diceulator/Data/globals.dart' as globals;
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class Dice_Calc_Page extends StatefulWidget {
  Dice_Calc_Page({Key key}) : super(key: key);

  @override
  _Dice_Calc_PageState createState() => _Dice_Calc_PageState();
}

class _Dice_Calc_PageState extends State<Dice_Calc_Page> {
  String CurEqu = '';
  List<String> OldEqu = [];
  String CurAns = '';
  List<String> OldAns = [];

  final _controller1 = ScrollController();
  final _controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globals.BackGround,
      body: SafeArea(
        child: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              color: globals.BackGround,
            ),
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
                                  color: globals.Primary,
                                  borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: globals.BackGround,
                                      blurRadius: 4.0,
                                      offset:
                                      Offset(2.0, 2.0), // shadow direction: bottom right
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  child: FadingEdgeScrollView.fromScrollView(
                                    child: ListView.builder(
                                      controller: _controller1,
                                      itemCount: OldAns.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return PastRolls_Card(index);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: FadingEdgeScrollView.fromSingleChildScrollView(
                                          child: SingleChildScrollView(
                                            controller: _controller2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.01),
                                                  alignment: Alignment.bottomRight,
                                                  child: Text(
                                                    globals.CurRolls.replaceAll('+', ' + '),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.02),
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          CurAns,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  ],
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
                          //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                CurEqu,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                              // border: Border(top: BorderSide(color: Colors.black),),
                              ),
                          // color: Colors.green,
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.025),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('7'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('8'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('9'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('C'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('4'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('5'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('6'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('-'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('1'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('2'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('3'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('+'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: <Widget>[
                                      Calc_Key('0'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Calc_Key('d'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                          child: Center(
                                            child: Text(
                                              '=',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (CurEqu.endsWith(' ') || CurEqu.endsWith('d') || CurEqu.isEmpty) {
                                              // Do Nothing
                                            } else {
                                              //                                Sets Current Equation stuff and updates 'old' lists
                                              setState(() {
                                                CurAns =
                                                    Equ_Solver(CurEqu).toString();
                                                OldAns.insert(0, CurAns);
                                                if (OldAns.length >
                                                    globals.OldListSize) {
                                                  OldAns.removeLast();
                                                }
                                                OldEqu.insert(0, CurEqu);
                                                if (OldEqu.length >
                                                    globals.OldListSize) {
                                                  OldEqu.removeLast();
                                                }

                                                //Setting Instance Info
                                                globals.Inst_CurEqu[
                                                    globals.CurrInst] = CurEqu;
                                                globals.Inst_CurAns[
                                                    globals.CurrInst] = CurAns;
                                                globals.Inst_CurRolls[globals
                                                    .CurrInst] = globals.CurRolls;

                                                globals.Inst_OldRolls[globals
                                                    .CurrInst] = globals.OldRolls;
                                                globals.Inst_OldEqu[
                                                    globals.CurrInst] = OldEqu;
                                                globals.Inst_OldAns[
                                                    globals.CurrInst] = OldAns;

                                                //print('${OldEqu}');
                                                //print('${globals.OldRolls}');
                                                //print('${OldAns}');
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: globals.Primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
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
                        //color: globals.Primary,
                        // border: Border(left: BorderSide(color: Colors.black),),
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Inst_Button(0),
                        Inst_Button(1),
                        Inst_Button(2),
                        Inst_Button(3),
                        Inst_Button(4),
                        Inst_Button(5),
                        Inst_Button(6),
                        Inst_Button(7),
                        Inst_Button(8),
                        Inst_Button(9),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Instance Button
  Widget Inst_Button(int place) {
    var _widthFactor = 0.9;
    var _heightFactor = 0.8;
    Color selColor = globals.Primary;

    if(place == globals.CurrInst)
      {
        //_widthFactor = 1;
        //_heightFactor = 0.9;
        selColor = globals.Secondary;
      }

    return Expanded(
      flex: 20,
      child: Container(
        child: SizedBox.expand(
          child: GestureDetector(
            onTap: () {
              setState(() {
                // Set Cur and Old variables to Inst_Curr and Inst_Old Variables based on 'place'
                CurEqu = globals.Inst_CurEqu[place];
                CurAns = globals.Inst_CurAns[place];
                globals.CurRolls = globals.Inst_CurRolls[place];
                globals.OldRolls = globals.Inst_OldRolls[place];
                OldEqu = globals.Inst_OldEqu[place];
                OldAns = globals.Inst_OldAns[place];


                //_widthFactor = 1;
                //_heightFactor = 0.9;
                selColor = globals.Secondary;
                globals.CurrInst = place;
              });
            },
            child: FractionallySizedBox(
              widthFactor: _widthFactor,
              heightFactor: _heightFactor,
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      globals.Primary,
                      globals.Primary,
                      selColor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: globals.BackGround,
                      blurRadius: 4.0,
                      offset:
                      Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                  ],
                  color: globals.Primary,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(50.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    place.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//                                                  //PastRolls Card
  Widget PastRolls_Card(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          CurEqu = OldEqu[index];
          CurAns = Equ_Solver(CurEqu).toString();
          OldAns.insert(0, CurAns);
          if (OldAns.length > globals.OldListSize) {
            OldAns.removeLast();
          }
          OldEqu.insert(0, CurEqu);
          if (OldEqu.length > globals.OldListSize) {
            OldEqu.removeLast();
          }
          //print('${OldEqu}');
          //print('${globals.OldRolls}');
          //print('${OldAns}');
        });
      },
      child: Container(
        margin: EdgeInsets.all(5),

        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              OldEqu[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              globals.OldRolls[index].replaceAll('+', ' + '),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${OldAns[index]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


  //                                                      Calculator Keys
  Widget Calc_Key(String Action) {
    Color BorderColor = Colors.green;//globals.Primary;


    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: globals.Primary,
            boxShadow: [
              BoxShadow(
                color: globals.BackGround,
                blurRadius: 4.0,
                offset:
                Offset(2.0, 2.0), // shadow direction: bottom right
              ),
            ],
            //border: Border.all(color: BorderColor, width: 2),
          ),
          child: Center(
            child: Text(
              Action == 'd' ?  'D' : Action,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        onTap: (){
          //                         Clear
          if (Action == 'C') {
            setState(() {
              CurEqu = '';
              CurAns = '';
              globals.CurRolls = '';
              globals.Inst_CurAns[globals.CurrInst] = '';
              globals.Inst_CurEqu[globals.CurrInst] = '';
              globals.Inst_CurRolls[globals.CurrInst] = '';
            });
            //                     Process Current Equation
          } else if (Action == '=') {
            if (CurEqu.endsWith(' ') || CurEqu.endsWith('d')) {
              // Do Nothing
            } else {
              setState(() {
                CurAns = Equ_Solver(CurEqu).toString();
              });
            }

            //                         Enter pressed button into Current Equation String 'CurEqu'
          } else {
            setState(() {
              if (Action == '+') {
                if (CurEqu.endsWith(' ') || CurEqu.endsWith('d')) {
                  //DO Nothing
                } else {
                  CurEqu = CurEqu + ' + ';
                }
              } else if (Action == '-') {
                if (CurEqu.endsWith(' ') || CurEqu.endsWith('d')) {
                  //DO Nothing
                } else {
                  CurEqu = CurEqu + ' - ';
                }
              } else if (Action == 'd' &&
                  (CurEqu.endsWith('d') ||
                      CurEqu.split(' ').last.contains('d'))) {
                //Do Nothing
              } else {
                if (CurEqu.split(' ').last.split('d').last.length > 3 &&
                    Action != 'd') {
                  // DO Nothing
                } else {
                  if (CurEqu.endsWith('d') && Action == '0') {
                    // DO Nothing
                  } else {
                    CurEqu = CurEqu + Action;
                  }
                }
              }
            });
          }
          globals.Inst_CurEqu[globals.CurrInst] = CurEqu;
          print(CurEqu);
        },
        /*onTapUp: (TapUpDetails tapUpDetails){
          BorderColor = globals.Primary;
          print("hello");
        },

         */
      ),
    );
  }
}
