import 'package:dieto/screens/byNutrients.dart';
import 'package:dieto/strings/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

var carbsRange = RangeValues(10,30);


class _SliderScreenState extends State<SliderScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSlider(
              //showValueIndicator: true,

              divisions: 9,
              values: carbsRange,
              min:10,
              max:100,
              labels: RangeLabels('${carbsRange.start.toInt()}','${carbsRange.end.toInt()}'),
              onChanged: (newRange){
                setState(() {
                  carbsRange=newRange;
                  sendValues(carbsRange);
                });
              },
            ),
            FlatButton(
              child : Text('OK'),
              onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipebyNutrients()));
              },
            ),
          ],
        ),
      ),
    );
  }

  void sendValues(RangeValues carbsRange){
    int start=carbsRange.start.toInt();
    int end=carbsRange.end.toInt();
    Provider.of<Constants>(context,listen: false).changeRange('$start', '$end');
  }

}

