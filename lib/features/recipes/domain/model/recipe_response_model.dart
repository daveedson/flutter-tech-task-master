// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeResponseModel {
  String? title;
  List<String>? ingredients;

  RecipeResponseModel({this.title, this.ingredients});

 factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseModelToJson(this);

  @override
  bool operator ==(covariant RecipeResponseModel other) {
    if (identical(this, other)) return true;

    return other.title == title && listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode => title.hashCode ^ ingredients.hashCode;

  @override
  String toString() =>
      'RecipeResponseModel(title: $title, ingredients: $ingredients)';
}
