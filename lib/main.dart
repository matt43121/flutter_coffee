import 'package:flutter/material.dart';
import 'home_widget.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,
  ),
  home: Home(),
));

class MainShortcuts extends StatefulWidget {
  @override
  _MainShortcutsState createState() => _MainShortcutsState();
}

class _MainShortcutsState extends State<MainShortcuts> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




