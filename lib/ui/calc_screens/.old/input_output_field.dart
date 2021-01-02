import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequitor/ui/consts/colors.dart';

//class InputField extends StatelessWidget {
  InputField({this.inputController, this.output});
  final TextEditingController inputController;
  final String output;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: inputController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[0-9\-\+\/\%x.()]')),
            FilteringTextInputFormatter.deny('..'),
            FilteringTextInputFormatter.deny('--'),
            FilteringTextInputFormatter.deny('++'),
            FilteringTextInputFormatter.deny('xx'),
            FilteringTextInputFormatter.deny('//'),
            FilteringTextInputFormatter.deny('%%'),
            FilteringTextInputFormatter.deny('(('),
            FilteringTextInputFormatter.deny('))'),
          ],
          autofocus: true,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: lightTextColor, fontSize: 32.0),
        ),
        Text(
          ' = ${output ?? ''}',
          style: TextStyle(color: lightTextColor, fontSize: 24.0),
        )
      ],
    );
  }
}
