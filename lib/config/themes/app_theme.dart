import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFE90101);
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
];

class ApppTheme {

  final int selectedColor;

  ApppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'Invalid color index');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }

}