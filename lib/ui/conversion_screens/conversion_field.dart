import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sequitor/controllers/conversion_controller.dart';
import 'package:sequitor/ui/consts/colors.dart';
import 'package:sequitor/ui/consts/mass.dart';

class ConversionField extends StatefulWidget {
  ConversionField({this.controller, this.isEditable});
  final ConversionController controller;
  final bool isEditable;
  @override
  _ConversionFieldState createState() => _ConversionFieldState();
}

class _ConversionFieldState extends State<ConversionField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Expanded(child: unitSystemDropDown()), Expanded(child: unitsDropDown())],
        ),
        Container(
          margin: EdgeInsets.only(top: 12.0, bottom: 12.0),
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Theme.of(context).primaryColorLight, width: 1)),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(border: InputBorder.none),
            style: TextStyle(color: lightTextColor, fontSize: 24.0),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
            enabled: widget.isEditable,
          ),
        )
      ],
    );
  }

  Widget unitSystemDropDown() {
    return Container(
      color: buttonColor,
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          focusColor: buttonColor,
          dropdownColor: buttonColor,
          value: widget.controller.unitSystem,
          items: List.generate(
              widget.controller.conversionMap.length,
              (index) => DropdownMenuItem(
                  value: widget.controller.conversionMap.keys.elementAt(index),
                  child: Text(
                    widget.controller.conversionMap.keys.elementAt(index),
                    style: TextStyle(color: darkTextColor, fontSize: 24.0),
                  ))),
          onChanged: (value) {
            setState(() {
              widget.controller.unitSystem = value;
              widget.controller.unit = widget
                  .controller.conversionMap[widget.controller.unitSystem]['units'].keys
                  .elementAt(0);
            });
          },
        ),
      ),
    );
  }

  Widget unitsDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: primaryColor,
          iconEnabledColor: lightTextColor,
          value: widget.controller.unit,
          items: List.generate(
              widget.controller.conversionMap[widget.controller.unitSystem]['units'].length,
              (index) => DropdownMenuItem(
                  value: widget.controller.conversionMap[widget.controller.unitSystem]['units'].keys
                      .elementAt(index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.controller.conversionMap[widget.controller.unitSystem]['units'].keys
                            .elementAt(index),
                        style: TextStyle(color: lightTextColor, fontSize: 24.0),
                      ),
                      Text(
                        widget
                            .controller
                            .conversionMap[widget.controller.unitSystem]['unit_description'][widget
                                .controller
                                .conversionMap[widget.controller.unitSystem]['units']
                                .keys
                                .elementAt(index)]
                            .split(':')[0],
                        style: TextStyle(color: lightTextColor),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ))),
          onChanged: (value) {
            setState(() {
              widget.controller.unit = value;
            });
          },
        ),
      ),
    );
  }
}
