import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequitor/ui/consts/colors.dart';

enum InputType { SIMPLE, PERCENT, CALCULATION }

class CalculatorInputField extends StatelessWidget {
  CalculatorInputField(
      {this.type, this.controller, this.onChanged, this.style, this.textAlign, this.suffix});
  final InputType type;
  final TextEditingController controller;
  final Function onChanged;
  final TextStyle style;
  final TextAlign textAlign;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(color: lightTextColor, fontSize: 24.0);
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: TextField(
        controller: controller,
        textAlign: textAlign ?? TextAlign.start,
        style: style ?? defaultStyle,
        decoration: InputDecoration(
            hintText: '0',
            suffix: Text(
              suffix ?? '',
              style: style ?? defaultStyle,
            )),
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        inputFormatters: (type == InputType.PERCENT)
            ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
            : null,
      ),
    );
  }
}
