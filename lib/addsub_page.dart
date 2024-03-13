import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class AddSubPage extends StatefulWidget {
  @override
  State<AddSubPage> createState() => _AddSubPageState();
}

class _AddSubPageState extends State<AddSubPage> {
  String userInput = "";
  String result = "0";
  List<String> buttonList = [
    '7',
    '8',
    '9',
    '+',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '=',
    '0',
    'AC'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Add & Subtract'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 47,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.white),
          Expanded(child: Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: buttonList.length,
                itemBuilder: (context, index){
                  return CustomButton(buttonList[index]);
                }
            ),
          )
          ),
        ],
      ),
    );
  }
  Widget CustomButton(String text){
    return InkWell(
      splashColor: Colors.black12,
      onTap: () {
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: getBgColor(text),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 5,
              offset: Offset(-3, -3)
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getColor(text),
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  getColor(String text){
    if(text == "+" || text == "-" || text == "="){
      return Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.white;
  }

  getBgColor(String text){
    if(text == "AC"){
      return Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.black;
  }

  handleButton(String text){
    if(text == "AC"){
      userInput = "";
      result = "0";
      return;
    }

    if(text == "="){
      result = calculate();
      userInput = result;
      return;
    }

    userInput = userInput + text;
  }

  String calculate(){
    try{
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch(e){
      return "Error";
    }
  }
}
