import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/features/recipes/application/services/ingredients_service.dart';
import 'package:tech_task/features/recipes/presentation/states/ingredients_state.dart';

import '../../domain/model/ingrident_response_model.dart';

final ingredientControllerProvider =
    StateNotifierProvider<IngredientsContoller, IngredientsState>((ref) {
  return IngredientsContoller(
      ref: ref,
      ingredientsState: IngredientsState(
        ingredients: const AsyncValue.data([]),
      ));
});

class IngredientsContoller extends StateNotifier<IngredientsState> {
  final Ref ref;

  IngredientsContoller({IngredientsState? ingredientsState, required this.ref})
      : super(ingredientsState!);

  Future<GetIngridentResponseModel?> getAllIngredients() async {
    state = state.copyWith(ingredients: const AsyncValue.loading());
    final result = await ref.read(ingredientServiceProvider).getIngredients();
   return result.when((success) {
      state = state.copyWith(ingredients: AsyncValue.data(success));
      return null;
    }, (error) {
      state = state.copyWith(
          ingredients: AsyncValue.error(error, StackTrace.current));
      return null;
    });
  }
}
