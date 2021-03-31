import 'dart:convert';
import 'package:dieto/models/dietapi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dieto/strings/constants.dart';
import 'package:provider/provider.dart';

Map<String, String> parameter = {
  'timeFrame': 'day',
  'targetCalories': '210',
  "diet": "",
  "apiKey": Api_key
};

var Api_key = "1af00909e5c14db1b179f061251bd144";

class API_Manager {

  Future getRecipe_Nut(BuildContext context) async {
    String url = GetUrlforNutrients(context);
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    var decode = jsonDecode(response.body);
    //print(decode[0]['image']);
    return decode;
  }

  Future getRecipebyId(String id) async {
    String url=GetUrlForRecipes(id);
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);

    var decode = jsonDecode(response.body);
    //print(decode);
    return decode;

  }
}

String GetUrlforNutrients(BuildContext context) {
  var nutrients =
      "https://api.spoonacular.com/recipes/findByNutrients?minCarbs="
      "${Provider.of<Constants>(context).minCarbs}"
      "&maxCarbs="
      "${Provider.of<Constants>(context).maxCarbs}"
      "&number=10&apiKey=1af00909e5c14db1b179f061251bd144";
  return nutrients;
}

String GetUrlForRecipes(String id) {
  var recipeurl = "https://api.spoonacular.com/recipes/"
      "$id"
      "/analyzedInstructions?apiKey=1af00909e5c14db1b179f061251bd144";
  return recipeurl;
}