import 'package:flutter/material.dart';

class Constants extends ChangeNotifier {

   static String minCarbs;
   static String maxCarbs;

   static  var nutrients = "https://api.spoonacular.com/recipes/findByNutrients?minCarbs=$minCarbs&maxCarbs=$maxCarbs&number=4&apiKey=1af00909e5c14db1b179f061251bd144";

   void changeRange(String mincarbs, String maxcarbs){
      minCarbs=mincarbs;
      maxCarbs=maxcarbs;
      notifyListeners();
   }
}