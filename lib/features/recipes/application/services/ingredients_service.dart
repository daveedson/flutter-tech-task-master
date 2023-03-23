import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/core/failure.dart';
import 'package:tech_task/features/recipes/data/remote/get_ingredients_repository_impl.dart';
import 'package:tech_task/features/recipes/data/remote/get_reciepe_repositoory_impl.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';

final ingredientServiceProvider = Provider<IngredientsService>((ref) {
  return IngredientServiceImpl(ref);
});

abstract class IngredientsService {
  Future<Result<List<GetIngridentResponseModel>, Failure>> getIngredients();
  Future<Result<List<RecipeResponseModel>, Failure>> getReciepe(
      String ingridents);
}

class IngredientServiceImpl implements IngredientsService {
  final Ref ref;

  IngredientServiceImpl(this.ref);

  @override
  Future<Result<List<GetIngridentResponseModel>, Failure>>
      getIngredients() async {
    try {
      final results =
          await ref.read(getIngridentsRepositoryProvider).fetchIngredients();

      if (results!.isEmpty) {
        return Error(Failure(message: 'No Ingredients found'));
      } else {
        return Success(results);
      }
    } on Failure catch (e) {
      return Error(e);
    }
  }

  @override
  Future<Result<List<RecipeResponseModel>, Failure>> getReciepe(String ingridents) async {
    try {
      final results =
          await ref.read(getReciepeProvider).fetchReciepe(ingridents);

      if (results!.isEmpty) {
        return Error(Failure(message: 'No Ingredients found'));
      } else {
        return Success(results);
      }
    } on Failure catch (e) {
      return Error(e);
    }
  }
}
