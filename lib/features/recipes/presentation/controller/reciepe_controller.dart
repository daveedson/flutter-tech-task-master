import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/features/recipes/application/services/ingredients_service.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';
import 'package:tech_task/features/recipes/presentation/states/reciepe_state.dart';

class ReciepeController extends StateNotifier<ReciepeState> {
  ReciepeController({required this.ref, ReciepeState? reciepeState})
      : super(reciepeState!);
  final Ref ref;

  Future<RecipeResponseModel?> getAllReciepe(String ingridents) async {
    state = state.copyWith(reciepe: const AsyncValue.loading());
    final result =
        await ref.read(ingredientServiceProvider).getReciepe(ingridents);
    return result.when(
      (success) {
        state = state.copyWith(reciepe: AsyncValue.data(success));
        return null;
      },
      (error) {
        state = state.copyWith(
            reciepe: AsyncValue.error(error, StackTrace.current));
        return null;
      },
    );
  }
}
