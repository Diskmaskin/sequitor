import 'package:flutter/material.dart';
import 'package:sequitor/utils/converter.dart';
import 'package:sequitor/controllers/conversion_controller.dart';
import 'package:sequitor/ui/consts/colors.dart';
import 'package:sequitor/ui/conversion_screens/conversion_field.dart';

class MassScreen extends StatefulWidget {
  @override
  _MassScreenState createState() => _MassScreenState();
}

class _MassScreenState extends State<MassScreen> {
  ConversionController fromConvController = ConversionController(ConversionType.MASS);
  ConversionController toConvController = ConversionController(ConversionType.MASS);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundcolor,
      appBar: AppBar(
        title: Text('Weight Conversion'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              fromToText('From: '),
              ConversionField(controller: fromConvController),
              RaisedButton(
                color: buttonColor,
                onPressed: () {
                  setState(() {
                    var tmp = fromConvController;
                    fromConvController = toConvController;
                    toConvController = tmp;
                  });
                },
                child: Icon(Icons.swap_vert),
              ),
              fromToText('To: '),
              ConversionField(
                controller: toConvController,
                isEditable: false,
              ),
            ],
          ),
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  print(fromConvController.text);
                  toConvController.text = Converter.convert(
                      fromConvController, double.parse(fromConvController.text), toConvController);
                });
              },
              child: Text(
                'Convert',
                style: TextStyle(color: lightTextColor, fontSize: 24.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget fromToText(String s) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        s,
        style: TextStyle(color: lightTextColor, fontSize: 24.0),
      ),
    );
  }
}
