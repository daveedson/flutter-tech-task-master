import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/features/recipes/application/services/ingredients_service.dart';
import 'package:tech_task/features/recipes/presentation/states/ingredients_state.dart';

class IngredientsContoller extends StateNotifier<IngredientsState> {
  final Ref ref;

  IngredientsContoller({IngredientsState? ingredientsState, required this.ref})
      : super(ingredientsState!);

  Future<void> getAllIngredients() async {
    state = state.copyWith(ingredients: const AsyncValue.loading());
    final result = await ref.read(ingredientServiceProvider).getIngredients();
    result.when((success) {
     return state = state.copyWith(ingredients: AsyncValue.data(success));
    }, (error) {
      state = state.copyWith(
          ingredients: AsyncValue.error(error, StackTrace.current));
    });
  }
}
