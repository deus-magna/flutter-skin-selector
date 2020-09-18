import 'package:flutter/material.dart';
import 'package:skin_selector/screens/skin_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Material App',
      home: DBrandSkinSelection(),
    );
  }
}