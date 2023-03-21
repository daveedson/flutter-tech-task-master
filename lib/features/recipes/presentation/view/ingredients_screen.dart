import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_task/features/recipes/data/remote/get_ingredients_repository_impl.dart';

class IngredientsScreen extends ConsumerWidget {
  const IngredientsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FilledButton(
            onPressed: () {
              ref.read(getIngridentsRepositoryProvider).fetchIngredients();
            },
            child: Text("click me")),
      ),
    );
  }
}
