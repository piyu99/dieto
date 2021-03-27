import 'dart:convert';
import 'package:dieto/models/dietapi.dart';
import 'package:http/http.dart' as http;
import 'package:dieto/strings/constants.dart';

Map<String,String> parameter= {
  'timeFrame':'day',
  'targetCalories' : '210',
  "diet" : "",
  "apiKey": Api_key

};

var Api_key = "1af00909e5c14db1b179f061251bd144";


Uri uri=Uri.parse(Constants.nutrients);

class API_Manager {
  Future getRecipe_Nut() async {

    http.Response response= await http.get(uri);

    var decode=jsonDecode(response.body);
    print(decode[0]['image']);
    return decode;
  }
  }

