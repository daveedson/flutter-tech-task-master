// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';

class IngredientsState {
  IngredientsState({required this.ingredients});
  final AsyncValue<List<GetIngridentResponseModel>> ingredients;
  

  IngredientsState copyWith({
    AsyncValue<List<GetIngridentResponseModel>>? ingredients,
  }) {
    return IngredientsState(
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  String toString() => 'IngredientsState(ingredients: $ingredients)';
}
