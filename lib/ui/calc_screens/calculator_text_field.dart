import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequitor/controllers/calculation_controller.dart';
import 'package:sequitor/ui/consts/colors.dart';

class CalculatorTextField extends StatelessWidget {
  CalculatorTextField({this.controller, this.textAlign});
  final CalculationController controller;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ?? CalculationController(),
      keyboardType: TextInputType.number,
      // Deprecated filtering - CalculationController handles inputfiltering
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp('[0-9\-\+\/\%x.()]')),
      //   FilteringTextInputFormatter.deny('..'),
      //   FilteringTextInputFormatter.deny('--'),
      //   FilteringTextInputFormatter.deny('++'),
      //   FilteringTextInputFormatter.deny('xx'),
      //   FilteringTextInputFormatter.deny('//'),
      //   FilteringTextInputFormatter.deny('%%'),
      //   FilteringTextInputFormatter.deny('(('),
      //   FilteringTextInputFormatter.deny('))'),
      // ],
      autofocus: true,
      textAlign: textAlign ?? TextAlign.end,
      style: TextStyle(color: lightTextColor, fontSize: 32.0),
    );
  }
}
