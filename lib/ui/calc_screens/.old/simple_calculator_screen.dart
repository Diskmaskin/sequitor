import 'package:flutter/material.dart';
import 'package:sequitor/utils/calculator.dart';
import 'package:sequitor/ui/calc_screens/.old/input_output_field.dart';
import 'package:sequitor/ui/consts/colors.dart';

//class SimpleCalculatorScreenR1 extends StatefulWidget {
  @override
  _SimpleCalculatorScreenR1State createState() => _SimpleCalculatorScreenR1State();
}

class _SimpleCalculatorScreenR1State extends State<SimpleCalculatorScreenR1> {
  TextEditingController inputController = TextEditingController();

  String output;

  final List<String> operators = [
    //IGNORE
    '${Calculator.REMAIN}', '(', ')', '',
    '${Calculator.DIV}', '${Calculator.MULT}', '${Calculator.SUB}', '${Calculator.ADD}'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputController.selection = TextSelection(
        baseOffset: inputController.selection.start, extentOffset: inputController.selection.end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundcolor,
      appBar: AppBar(title: Text('Simple calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: InputField(
              inputController: inputController,
              output: output,
            ),
          ),
          Expanded(child: buttonGrid()),
          Container(
            height: 64,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => inputController.clear(),
                    child: Text(
                      'Clear',
                      style: TextStyle(color: lightTextColor, fontSize: 24.0),
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        output = Calculator.calculateString(inputController.text);
                      });
                    },
                    child: Text(
                      '=',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Theme.of(context).textTheme.headline4.fontSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonGrid() {
    return GridView.count(
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      crossAxisCount: 4,
      children: List.generate(
          operators.length,
          (index) => (operators[index] != '')
              ? RaisedButton(
                  color: buttonColor,
                  onPressed: () {
                    if (inputController.text != '' &&
                        !inputController.text
                            .substring(0, inputController.selection.start)
                            .endsWith(operators[index])) {
                      inputController.value = TextEditingValue(
                          text: inputController.text.substring(0, inputController.selection.start) +
                              operators[index] +
                              inputController.text.substring(
                                  inputController.selection.start, inputController.text.length),
                          selection: TextSelection(
                              baseOffset: inputController.selection.start + 1,
                              extentOffset: inputController.selection.end + 1));
                    }
                  },
                  child: Text(
                    operators[index],
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                )
              : Container()),
    );
  }
}
