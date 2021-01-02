import 'package:flutter/material.dart';
import 'package:sequitor/ui/consts/colors.dart';

class CurrencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundcolor,
      appBar: AppBar(
        title: Text('Currency translator'),
      ),
    );
  }
}
