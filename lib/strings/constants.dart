
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Constants extends ChangeNotifier {

    String minCarbs;
    String maxCarbs;



   void changeRange(String mincarbs, String maxcarbs){
      minCarbs=mincarbs;
      maxCarbs=maxcarbs;
      notifyListeners();
   }

}


