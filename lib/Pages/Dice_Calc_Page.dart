import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dicecalc_diceulator/Functions/Calc_Functions.dart';
import 'package:dicecalc_diceulator/Data/globals.dart' as globals;
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:dicecalc_diceulator/Data/Dice_Calc_Data.dart';
import 'package:hive/hive.dart';

class DiceCalcPage extends StatefulWidget {
  DiceCalcPage({Key key}) : super(key: key);

  @override
  _DiceCalcPageState createState() => _DiceCalcPageState();
}

class _DiceCalcPageState extends State<DiceCalcPage> {
  String curEqu = '';
  List<String> oldEqu = [];
  String curAns = '';
  List<String> oldAns = [];

  final _controller1 = ScrollController();
  final _controller2 = ScrollController();





  @override
  void dispose(){
    Hive.box(globals.box_name).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var data = Dice_Calc_Data(globals.Inst_OldRolls,globals.Inst_OldAns,globals.Inst_OldEqu,globals.Inst_CurEqu,globals.Inst_CurAns,globals.Inst_CurRolls);
    // if(globals.box.get('0') == null)
    //   {
    //     globals.box.put('0', data);
    //   }else
    //     {
    //       data = globals.box.get('0');
    //       globals.Inst_OldRolls = data.Inst_OldRolls;
    //       globals.Inst_OldAns = data.Inst_OldAns;
    //       globals.Inst_OldEqu = data.Inst_OldEqu;
    //       globals.Inst_CurEqu = data.Inst_CurEqu;
    //       globals.Inst_CurAns = data.Inst_CurAns;
    //       globals.Inst_CurRolls = data.Inst_CurRolls;
    //     }
    var data = Dice_Calc_Data(globals.OldRolls);
    if(globals.box.get('0') == null)
      {
        globals.box.put('0', data);
      }else{
      print(globals.box.get('0'));
    }


    return Scaffold(
      backgroundColor: globals.BackGround,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     // var data = Dice_Calc_Data('hello',69);
      //     // globals.box.put('stuff', data);
      //     // Printbox(globals.box);
      //     // print(data.age);
      //
      //
      //
      //     var get_data = globals.box.get('stuff');
      //     print(get_data.name);
      //
      //     get_data.name = 'no';
      //     get_data.save();
      //   },
      // ),
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
                                      color: globals.ShadowColor,
                                      blurRadius: 2.0,
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
                                      itemCount: oldAns.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return PastRollsCard(index);
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
                                                    globals.CurRolls.replaceAll('+', ' + ').replaceAll('-', ' - '),
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
                                      child: GestureDetector(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.02),
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            curAns,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if(curEqu.split(' ').last.split('d').last.length + curAns.length < 5)
                                              {
                                                curEqu += curAns;
                                              }
                                          });
                                        }
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
                                curEqu,
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
                                      CalcKey('7'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('8'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('9'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('C'),
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
                                      CalcKey('4'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('5'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('6'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('-'),
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
                                      CalcKey('1'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('2'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('3'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('+'),
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
                                      CalcKey('0'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      CalcKey('d'),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.horizontal(
                                                left: Radius.circular(50),
                                                right: Radius.circular(50),
                                              ),
                                              color: globals.Primary,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: globals.ShadowColor,
                                                  blurRadius: 2.0,
                                                  offset:
                                                  Offset(2.0, 2.0), // shadow direction: bottom right
                                                ),
                                              ],
                                              //border: Border.all(color: BorderColor, width: 2),
                                            ),

                                            child: Center(
                                              child: Text(
                                                '=',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          onTap: (){
                                            /// Save data to local storage
                                            // data = Dice_Calc_Data(globals.Inst_OldRolls,globals.Inst_OldAns,globals.Inst_OldEqu,globals.Inst_CurEqu,globals.Inst_CurAns,globals.Inst_CurRolls);
                                            // globals.box.put('0', data);

                                            /// Calc button functionality
                                            if (curEqu.endsWith(' ') || curEqu.endsWith('d') || curEqu.isEmpty) {
                                              // Do Nothing
                                            } else {
                                              //                                Sets Current Equation stuff and updates 'old' lists
                                              setState(() {
                                                curAns =
                                                    Equ_Solver(curEqu).toString();
                                                oldAns.insert(0, curAns);
                                                if (oldAns.length >
                                                    globals.OldListSize) {
                                                  oldAns.removeLast();
                                                }
                                                oldEqu.insert(0, curEqu);
                                                if (oldEqu.length >
                                                    globals.OldListSize) {
                                                  oldEqu.removeLast();
                                                }

                                                //Setting Instance Info
                                                globals.Inst_CurEqu[
                                                globals.CurrInst] = curEqu;
                                                globals.Inst_CurAns[
                                                globals.CurrInst] = curAns;
                                                globals.Inst_CurRolls[globals
                                                    .CurrInst] = globals.CurRolls;

                                                globals.Inst_OldRolls[globals
                                                    .CurrInst] = globals.OldRolls;
                                                globals.Inst_OldEqu[
                                                globals.CurrInst] = oldEqu;
                                                globals.Inst_OldAns[
                                                globals.CurrInst] = oldAns;

                                                //print('${OldEqu}');
                                                //print('${globals.OldRolls}');
                                                //print('${OldAns}');
                                              });
                                            }
                                          },
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
                        Inst_Button(0, '1'),
                        Inst_Button(1, '2'),
                        Inst_Button(2, '3'),
                        Inst_Button(3, '4'),
                        Inst_Button(4, '5'),
                        Inst_Button(5, '6'),
                        Inst_Button(6, '7'),
                        Inst_Button(7, '8'),
                        Inst_Button(8, '9'),
                        Inst_Button(9, '10'),
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

  ///     Instance Button                 String for display limited to 5 char
  Widget Inst_Button(int place, var display) {
    var _widthFactor = 0.9;
    var _heightFactor = 0.8;
    Color selColor = globals.Primary;

    if(place == globals.CurrInst)
      {
        _widthFactor = 1;
        _heightFactor = 0.9;
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
                curEqu = globals.Inst_CurEqu[place];
                curAns = globals.Inst_CurAns[place];
                globals.CurRolls = globals.Inst_CurRolls[place];
                globals.OldRolls = globals.Inst_OldRolls[place];
                oldEqu = globals.Inst_OldEqu[place];
                oldAns = globals.Inst_OldAns[place];


                _widthFactor = 1;
                _heightFactor = 0.9;
                selColor = globals.Secondary;
                globals.CurrInst = place;
              });
            },
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.8,
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: MediaQuery.of(context).size.width * 0.01,
                width: MediaQuery.of(context).size.width * 0.01,
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
                      color: globals.ShadowColor,
                      blurRadius: 2.0,
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
                    display.toString(),
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
  Widget PastRollsCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          globals.clearCount = 0;
          curEqu = oldEqu[index];
          curAns = Equ_Solver(curEqu).toString();
          oldAns.insert(0, curAns);
          if (oldAns.length > globals.OldListSize) {
            oldAns.removeLast();
          }
          oldEqu.insert(0, curEqu);
          if (oldEqu.length > globals.OldListSize) {
            oldEqu.removeLast();
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
              oldEqu[index],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              globals.OldRolls[index].replaceAll('+', ' + ').replaceAll('-', ' - '),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${oldAns[index]}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


  ///                                                      Calculator Keys
  Widget CalcKey(String Action) {
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
                color: globals.ShadowColor,
                blurRadius: 2.0,
                offset:
                Offset(2.0, 2.0), // shadow direction: bottom right
              ),
            ],
            //border: Border.all(color: BorderColor, width: 2),
          ),
          child: Center(
            child: Text(
              Action == 'd' ?  'D' : (Action == 'C' && globals.clearCount == 1 && curAns.isNotEmpty) ? 'AC' : Action,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        onTap: (){
          //                         Clear
          if (Action == 'C') {
            setState(() {
              globals.clearCount++;
              curEqu = '';
              globals.Inst_CurEqu[globals.CurrInst] = '';
              if(globals.clearCount > 1)
                {
                  curAns = '';
                  globals.CurRolls = '';
                  globals.Inst_CurAns[globals.CurrInst] = '';
                  globals.Inst_CurRolls[globals.CurrInst] = '';
                  globals.clearCount = 0;
                }
              //print("ClearCount = ${globals.clearCount}");
            });
            //                     Process Current Equation
          } else if (Action == '=') {
            if (curEqu.endsWith(' ') || curEqu.endsWith('d')) {
              // Do Nothing
            } else {
              setState(() {
                curAns = Equ_Solver(curEqu).toString();
              });
            }

            //                         Enter pressed button into Current Equation String 'CurEqu'
          } else {
            setState(() {
              if (Action == '+') {
                if (curEqu.endsWith(' ') || curEqu.endsWith('d') || curEqu.isEmpty) {
                  //DO Nothing
                } else {
                  curEqu = curEqu + ' + ';
                }
              } else if (Action == '-') {
                if (curEqu.endsWith(' ') || curEqu.endsWith('d') || curEqu.isEmpty) {
                  //DO Nothing
                } else {
                  curEqu = curEqu + ' - ';
                }
              } else if (Action == 'd' &&
                  (curEqu.endsWith('d') ||
                      curEqu.split(' ').last.contains('d'))) {
                //Do Nothing
              } else {
                if (curEqu.split(' ').last.split('d').last.length > 3 &&
                    Action != 'd') {
                  // DO Nothing
                } else {
                  if (curEqu.endsWith('d') && Action == '0') {
                    // DO Nothing
                  } else {
                    curEqu = curEqu + Action;
                  }
                }
              }
            });
          }

          if(Action != 'C')
            {
              globals.clearCount = 0;
            }
          globals.Inst_CurEqu[globals.CurrInst] = curEqu;
          //print(CurEqu);
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