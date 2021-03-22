// To parse this JSON data, do
//
//     final nutrients = nutrientsFromJson(jsonString);

import 'dart:convert';

Nutrients nutrientsFromJson(String str) => Nutrients.fromJson(json.decode(str));

String nutrientsToJson(Nutrients data) => json.encode(data.toJson());

class Nutrients {
  Nutrients({
    this.calories,
    this.carbs,
    this.fat,
    this.id,
    this.image,
    this.imageType,
    this.protein,
    this.title,
  });

  int calories;
  String carbs;
  String fat;
  int id;
  String image;
  String imageType;
  String protein;
  String title;

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
    calories: json["calories"],
    carbs: json["carbs"],
    fat: json["fat"],
    id: json["id"],
    image: json["image"],
    imageType: json["imageType"],
    protein: json["protein"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "carbs": carbs,
    "fat": fat,
    "id": id,
    "image": image,
    "imageType": imageType,
    "protein": protein,
    "title": title,
  };
}
