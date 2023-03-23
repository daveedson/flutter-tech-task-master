import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';

abstract class GetReciepeRepository {
  Future<List<RecipeResponseModel>?> fetchReciepe(String ingridents);
}
