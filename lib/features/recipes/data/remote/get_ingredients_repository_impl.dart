import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/core/failure.dart';
import 'package:tech_task/features/recipes/data/client/ingredients_client.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
import 'package:tech_task/features/recipes/domain/repository/get_ingredients_repository.dart';
import 'package:tech_task/main.dart';

final getIngridentsRepositoryProvider =
    Provider<GetIngredientsRepository>((ref) {
  return GetIngredientsRepositoryImplementation(
    IngredientClient(
      baseUrl: ref.read(dioProvider).options.baseUrl,
      ref.read(dioProvider),
    ),
  );
});

class GetIngredientsRepositoryImplementation
    implements GetIngredientsRepository {
  GetIngredientsRepositoryImplementation(this._ingredientClient);
  final IngredientClient _ingredientClient;

  @override
  Future<List<GetIngridentResponseModel>?> fetchIngredients() async {
    try {
      final response = await _ingredientClient.getIngredients();
     
      return response;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: "No internet connection",
          exception: e,
        );
      }
      throw Failure(message: "Something went wrong", exception: e);
    }
  }
}
