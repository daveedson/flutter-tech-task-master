import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/features/recipes/application/services/ingredients_service.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';
import 'package:tech_task/features/recipes/presentation/controller/ingredients_controller.dart';
import 'package:tech_task/features/recipes/presentation/states/reciepe_state.dart';

final reciepeControllerProvider =
    StateNotifierProvider<ReciepeController, ReciepeState>((ref) {
  return ReciepeController(
      ref: ref,
      reciepeState: ReciepeState(
        const AsyncValue.data([]),
      ));
});

class ReciepeController extends StateNotifier<ReciepeState> {
  ReciepeController({required this.ref, ReciepeState? reciepeState})
      : super(reciepeState!);
  final Ref ref;

  Future<RecipeResponseModel?> getAllReciepe() async {
    final selectedIngridents =
        ref.read(ingredientControllerProvider.notifier).selectedItems;

   final ingreidents =  selectedIngridents.join(",");

    state = state.copyWith(reciepe: const AsyncValue.loading());
    final result =
        await ref.read(ingredientServiceProvider).getReciepe(ingreidents);
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
