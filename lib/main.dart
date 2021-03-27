import 'strings/constants.dart';
import 'package:dieto/screens/Slider.dart';
import 'package:dieto/screens/byNutrients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(ChangeNotifierProvider<Constants>(
      create: (context){
        return Constants();
      },
      child: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return
//      ChangeNotifierProvider<Constants>(
//      create: (context){
//        return Constants();
//      },
//      child:
      MaterialApp(
        home: SliderScreen()
      );
  //  );
  }
}