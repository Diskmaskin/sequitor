// Simple Calculator r2

import 'package:flutter/material.dart';
import 'package:sequitor/controllers/calculation_controller.dart';
import 'package:sequitor/ui/calc_screens/calculator_text_field.dart';
import 'package:sequitor/utils/calculator.dart';
import 'package:sequitor/ui/consts/colors.dart';

class SimpleCalculatorScreen extends StatefulWidget {
  @override
  _SimpleCalculatorScreenState createState() => _SimpleCalculatorScreenState();
}

class _SimpleCalculatorScreenState extends State<SimpleCalculatorScreen> {
  CalculationController calculationController = CalculationController();
  String result;

  String output;

  final List<String> operators = [
    //IGNORE
    '${Calculator.REMAIN}', '${Calculator.PAR_START}', '${Calculator.PAR_END}', '',
    '${Calculator.DIV}', '${Calculator.MULT}', '${Calculator.SUB}', '${Calculator.ADD}'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculationController.selection = TextSelection(
        baseOffset: calculationController.selection.start,
        extentOffset: calculationController.selection.end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundcolor,
      appBar: AppBar(title: Text('Simple calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CalculatorTextField(
                  controller: calculationController,
                ),
                Text(
                  ' = ${result ?? ''}',
                  style: TextStyle(color: lightTextColor, fontSize: 24.0),
                )
              ],
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
                    onPressed: () => calculationController.clear(),
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
                        result = calculationController.calculatedText;
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
                    //TODO: Move checks to controller?
                    if (calculationController.text != '' &&
                        !calculationController.text
                            .substring(0, calculationController.selection.start)
                            .endsWith(operators[index])) {
                      calculationController.value = TextEditingValue(
                          text: calculationController.text
                                  .substring(0, calculationController.selection.start) +
                              operators[index] +
                              calculationController.text.substring(
                                  calculationController.selection.start,
                                  calculationController.text.length),
                          selection: TextSelection(
                              baseOffset: calculationController.selection.start + 1,
                              extentOffset: calculationController.selection.end + 1));
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
