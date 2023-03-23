import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_task/core/routes.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
import 'package:tech_task/features/recipes/presentation/controller/ingredients_controller.dart';
import 'package:tech_task/widgets/ingredients_container.dart';

class IngredientsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientsScreenState();
}

class _IngredientsScreenState extends ConsumerState<IngredientsScreen> {
  late Future<GetIngridentResponseModel?> getData;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ref.read(ingredientControllerProvider.notifier).getAllIngredients());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems =
        ref.read(ingredientControllerProvider.notifier).selectedItems;
    return ref.watch(ingredientControllerProvider).ingredients.when(
          data: (List<GetIngridentResponseModel> data) => Scaffold(
              floatingActionButton: selectedItems.isEmpty
                  ? null
                  : FloatingActionButton.extended(
                      backgroundColor: Color(0xffEF2D5A),
                      onPressed: () {
                        context.goNamed(AppRoute.reciepe.name);
                      },
                      label: Text(
                        "Create Recepie",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0),
                      )),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                foregroundColor: Colors.black,
                title: Text(
                  "Select ingredients 🥗🌶️",
                  style: TextStyle(fontSize: 22.0),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30.0,
                  ),
                  color: Colors.black,
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 70.0),
                      itemBuilder: (context, index) {
                        final ingredients = data[index];
                        return IngredientContainer(
                          name: ingredients.title!,
                          date: ingredients.useBy!,
                          isSelected: selectedItems.contains(ingredients.title),
                          onAdd: (String? name) {
                            if (name != null) {
                              setState(() {
                                selectedItems.add(name);
                              });
                              print(selectedItems);
                            }
                          },
                          onRemove: (String? name) {
                            if (name != null) {
                              setState(() {
                                selectedItems.remove(name);
                              });
                              print(selectedItems);
                            }
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: data.length,
                    )),
              )),
          error: (e, error) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30.0,
                ),
                color: Colors.black,
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("images/somethingerror.json"),
                  Text(
                    "Something went wrong,check your internet and please try again",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          loading: () => Scaffold(
            body: Center(
              child: SpinKitSpinningLines(
                color: Color(0xffEF2D5A),
                size: 90.0,
              ),
            ),
          ),
        );
  }
}
