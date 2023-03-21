import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
part 'ingredients_client.g.dart';

@RestApi()
abstract class IngredientClient {
  factory IngredientClient(Dio dio, {String baseUrl}) = _IngredientClient;

  @GET("ingredients")
Future <List<GetIngridentResponseModel>?> getIngredients();
}
