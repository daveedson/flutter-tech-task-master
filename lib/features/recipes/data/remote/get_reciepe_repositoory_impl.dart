import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/core/failure.dart';
import 'package:tech_task/features/recipes/data/client/reciepe_client.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';
import 'package:tech_task/features/recipes/domain/repository/get_reciepe_repository.dart';
import 'package:tech_task/main.dart';

final getReciepeProvider = Provider<GetReciepeRepository>(
  (ref) {
    return GetReciepeRepositoryImplementation(
      ReciepeClient(
        baseUrl: ref.read(dioProvider).options.baseUrl,
        ref.read(dioProvider),
      ),
    );
  },
);

class GetReciepeRepositoryImplementation implements GetReciepeRepository {
  final ReciepeClient _reciepeClient;

  GetReciepeRepositoryImplementation(this._reciepeClient);

  @override
  Future<List<RecipeResponseModel>?> fetchReciepe(String ingridents) async {
    try {
      final response = await _reciepeClient.getReciepe(ingridents);

      return response;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: "No internet connection",
          exception: e,
        );
      }
      throw Failure(message: "Something went wrong", exception: e);
    }
  }
}
