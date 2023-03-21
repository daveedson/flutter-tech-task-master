import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/core/failure.dart';
import 'package:tech_task/features/recipes/data/remote/get_ingredients_repository_impl.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
import 'package:multiple_result/multiple_result.dart';

final ingredientServiceProvider = Provider<IngredientsService>((ref) {
  return IngredientServiceImpl(ref);
});

abstract class IngredientsService {
  Future<Result<GetIngridentResponseModel, Failure>> getIngredientsService();
}

class IngredientServiceImpl implements IngredientsService {
  final Ref ref;

  IngredientServiceImpl(this.ref);

  @override
  Future<Result<GetIngridentResponseModel, Failure>>
      getIngredientsService() async {
    try {
      final results =
          await ref.read(getIngridentsRepositoryProvider).fetchIngredients();
      var resultResponse;
      results.forEach((element) {
        resultResponse = element;
        print(resultResponse);
      });
      if (results.isEmpty) {
        return Error(Failure(message: 'No Ingredients found'));
      } else {
        return Success(resultResponse);
      }
    } on Failure catch (e) {
      return Error(e);
    }
  }
}
