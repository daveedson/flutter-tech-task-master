// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeResponseModel _$RecipeResponseModelFromJson(Map<String, dynamic> json) =>
    RecipeResponseModel(
      title: json['title'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeResponseModelToJson(
        RecipeResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ingredients': instance.ingredients,
    };
