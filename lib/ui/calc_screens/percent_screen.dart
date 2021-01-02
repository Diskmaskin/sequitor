import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequitor/ui/calc_screens/calculator_input_field.dart';
import 'package:sequitor/utils/calculator.dart';
import 'package:sequitor/ui/consts/colors.dart';

class PercentScreen extends StatefulWidget {
  @override
  _PercentScreenState createState() => _PercentScreenState();
}

class _PercentScreenState extends State<PercentScreen> {
  final TextEditingController leftWhatController = TextEditingController();
  final TextEditingController rightWhatController = TextEditingController();
  final TextEditingController resultWhatController = TextEditingController();

  final TextEditingController leftOfController = TextEditingController();
  final TextEditingController rightOfController = TextEditingController();
  final TextEditingController resultOfController = TextEditingController();

  final TextEditingController leftChangeController = TextEditingController();
  final TextEditingController rightChangeController = TextEditingController();
  final TextEditingController resultChangeController = TextEditingController();

  void onChange(String type) {
    setState(() {
      if (type == 'what') {
        var a = (leftWhatController.text == null || leftWhatController.text == '')
            ? 0
            : double.parse(leftWhatController.text);
        var b = (rightWhatController.text == null || rightWhatController.text == '')
            ? 0
            : double.parse(rightWhatController.text);
        resultWhatController.text = '${Calculator.percentageAOfB(a, b).toStringAsFixed(2)}%';
      } else if (type == 'of') {
        var a = (leftOfController.text == null || leftOfController.text == '')
            ? 0
            : double.parse(leftOfController.text);
        var b = (rightOfController.text == null || rightOfController.text == '')
            ? 0
            : double.parse(rightOfController.text);
        resultOfController.text = Calculator.percentAOfB(a, b).toStringAsFixed(2);
      } else if (type == 'change') {
        var a = (leftChangeController.text == null || leftChangeController.text == '')
            ? 0
            : double.parse(leftChangeController.text);
        var b = (rightChangeController.text == null || rightChangeController.text == '')
            ? 0
            : double.parse(rightChangeController.text);
        resultChangeController.text = '${Calculator.percentageChange(a, b).toStringAsFixed(2)}%';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Percent calculator'),
        ),
        backgroundColor: scaffoldBackgroundcolor,
        body: ListView(
          children: [
            divider(),
            whatPercent(),
            divider(),
            ofPercent(),
            divider(),
            changePercent(),
            divider()
          ],
        ));
  }

  Widget text(String s) => Text(
        s,
        style: TextStyle(color: buttonColor, fontSize: 24.0),
      );

  Widget outputField(TextEditingController controller) => TextField(
        controller: controller,
        style: TextStyle(color: lightTextColor, fontSize: 16.0),
        enabled: false,
      );

  Widget divider() => Divider(
        height: 64.0,
        thickness: 5.0,
        // color: buttonColor.withOpacity(0.2),
      );

  Widget whatPercent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
              child: CalculatorInputField(
            type: InputType.PERCENT,
            controller: leftWhatController,
            textAlign: TextAlign.end,
            onChanged: (value) => onChange('what'),
          )),
          Expanded(child: text('is what % of')),
          Expanded(
              child: CalculatorInputField(
            type: InputType.PERCENT,
            controller: rightWhatController,
            onChanged: (value) => onChange('what'),
          ))
        ]),
        Row(
          children: [
            text('= '),
            Expanded(child: outputField(resultWhatController)),
            // Spacer(flex: 1)
          ],
        )
      ],
    );
  }

  Widget ofPercent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(
              child: CalculatorInputField(
            type: InputType.PERCENT,
            controller: leftOfController,
            textAlign: TextAlign.end,
            onChanged: (value) => onChange('of'),
            suffix: '%',
          )),
          Expanded(child: text('of')),
          Expanded(
              child: CalculatorInputField(
            type: InputType.PERCENT,
            controller: rightOfController,
            onChanged: (value) => onChange('of'),
          ))
        ]),
        Row(
          children: [
            text('= '),
            Expanded(child: outputField(resultOfController)),
          ],
        )
      ],
    );
  }

  Widget changePercent() {
    return Column(
      children: [
        Row(
          children: [
            text('% change from '),
            Expanded(
                child: CalculatorInputField(
              type: InputType.PERCENT,
              controller: leftChangeController,
              onChanged: (value) => onChange('change'),
            )),
            text('to'),
            Expanded(
                child: CalculatorInputField(
              type: InputType.PERCENT,
              controller: rightChangeController,
              onChanged: (value) => onChange('change'),
            ))
          ],
        ),
        Row(
          children: [text('= '), Expanded(child: outputField(resultChangeController))],
        )
      ],
    );
  }
}
