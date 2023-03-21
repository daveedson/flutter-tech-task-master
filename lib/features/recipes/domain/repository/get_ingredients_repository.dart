import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';

abstract class GetIngredientsRepository {
  Future <List<GetIngridentResponseModel>?> fetchIngredients();
}
