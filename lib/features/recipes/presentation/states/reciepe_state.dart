// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';

class ReciepeState {
    final AsyncValue<List<RecipeResponseModel>> reciepe;

  ReciepeState(this.reciepe);

  @override
  String toString() => 'ReciepeState(reciepe: $reciepe)';

  @override
  bool operator ==(covariant ReciepeState other) {
    if (identical(this, other)) return true;
  
    return 
      other.reciepe == reciepe;
  }

  @override
  int get hashCode => reciepe.hashCode;

  ReciepeState copyWith({
    AsyncValue<List<RecipeResponseModel>>? reciepe,
  }) {
    return ReciepeState(
      reciepe ?? this.reciepe,
    );
  }
}
