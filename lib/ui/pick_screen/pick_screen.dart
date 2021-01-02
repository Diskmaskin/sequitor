import 'package:flutter/material.dart';
import 'package:sequitor/ui/calc_screens/percent_screen.dart';
import 'package:sequitor/ui/calc_screens/simple_calculator_screen.dart';
import 'package:sequitor/ui/consts/colors.dart';
import 'package:sequitor/ui/conversion_screens/mass_screen.dart';

class PickScreen extends StatefulWidget {
  @override
  _PickScreenState createState() => _PickScreenState();
}

class _PickScreenState extends State<PickScreen> {
  bool calculatorsIsCollapsed = true;
  final List<String> calculators = ['Simple', 'Percent'];
  bool convertersIsCollapsed = true;
  final List<String> converters = ['Mass (Weight)', 'Distance', 'Volume', 'Currencies'];

  void navigate(BuildContext context, String screen) {
    Widget target;
    switch (screen) {
      case 'Simple':
        target = SimpleCalculatorScreen();
        break;
      case 'Percent':
        target = PercentScreen();
        break;
      case 'Mass (Weight)':
        target = MassScreen();
        break;
      case 'Disctance':
        target = null;
        break;
      case 'Volume':
        target = null;
        break;
      case 'Currencies':
        target = null;
        break;
    }
    if (target == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Coming soon!'),
                actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Cool'))],
              ));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => target));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            headerButton(context, 'Calculators'),
            if (!calculatorsIsCollapsed)
              Expanded(
                flex: 3,
                child: menu(calculators),
              ),
            headerButton(context, 'Converters'),
            if (!convertersIsCollapsed)
              Expanded(
                flex: 3,
                child: menu(converters),
              )
          ],
        ),
      ),
    );
  }

  //TODO: Fix ugly written widget
  Widget headerButton(BuildContext context, String s) {
    return RaisedButton(
      color: primaryColor,
      onPressed: () {
        setState(() {
          if (s == 'Calculators') {
            calculatorsIsCollapsed = !calculatorsIsCollapsed;
          } else if (s == 'Converters') {
            convertersIsCollapsed = !convertersIsCollapsed;
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            s,
            style: TextStyle(color: lightTextColor, fontSize: 36.0),
          ),
          Icon(
            ((s == 'Calculators')
                    ? calculatorsIsCollapsed
                    : (s == 'Converters')
                        ? convertersIsCollapsed
                        : null)
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            color: lightTextColor,
          ),
        ],
      ),
    );
  }

  Widget menu(List<String> options) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
            options.length,
            (index) => RaisedButton(
                  color: buttonColor,
                  onPressed: () => navigate(context, options[index]),
                  child: Text(options[index]),
                )));
  }
}
