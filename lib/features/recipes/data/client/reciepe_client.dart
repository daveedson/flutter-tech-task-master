import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';
part 'reciepe_client.g.dart';

@RestApi()
abstract class ReciepeClient {
  factory ReciepeClient(Dio dio, {String baseUrl}) = _ReciepeClient;

  @GET("recipes")
  Future<List<RecipeResponseModel>?> getReciepe(@Query("ingredients") ingredients);
}
