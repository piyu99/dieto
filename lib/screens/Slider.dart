import 'package:dieto/screens/byNutrients.dart';
import 'package:dieto/strings/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: Stack(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 20,),
                Image.asset('assets/img.png'),
                Container(
                  height: MediaQuery.of(context).size.height/2-50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: Colors.greenAccent[100],
                  ),

                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        height: 80,
                        width: 250,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).primaryColor,
                    ),
                        child: Center(
                          child: Text('PICK UP YOUR CARBS RANGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.teal[400],

                          ),),
                        ),
                      ),
                      Expanded(
                        child: RangeSlider(
                          activeColor: Colors.teal[600],
                          inactiveColor: Colors.teal[300],
                          divisions: 9,
                          values: carbsRange,
                          min:10,
                          max:100,
                          labels: RangeLabels('${carbsRange.start.toInt()} g','${carbsRange.end.toInt()} g'),
                          onChanged: (newRange){
                            setState(() {
                              carbsRange=newRange;

                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          child : Container(
                            height: 80,
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.teal[600],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('FIND ME MY RECIPES!!  ',
                                style: TextStyle(
                                  color: Colors.greenAccent[100],
                                  fontSize: 18
                                ),),
                                Icon(Icons.arrow_right_alt,
                                color:  Colors.greenAccent[100],
                                size: 40,)
                              ],
                            ),
                          ),
                          onPressed: (){
                            sendValues(carbsRange);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipebyNutrients()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Positioned(
              right: 10,
              top: 30,
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).buttonColor,
                child: Icon(Icons.lightbulb_outline),
                onPressed: (){
                  Get.changeThemeMode(Get.isDarkMode?ThemeMode.light:ThemeMode.dark);
                },
              ),
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

