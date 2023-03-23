import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_task/features/recipes/domain/model/ingrident_response_model.dart';
import 'package:tech_task/features/recipes/presentation/controller/ingredients_controller.dart';
import 'package:tech_task/widgets/ingredients_container.dart';

class IngredientsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientsScreenState();
  static GetIngridentResponseModel? ingredients;
}

class _IngredientsScreenState extends ConsumerState<IngredientsScreen> {
  late Future<GetIngridentResponseModel?> getData;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ref.read(ingredientControllerProvider.notifier).getAllIngredients());
    super.initState();
  }

  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return
        // FutureBuilder<GetIngridentResponseModel>(
        //   future: getData,
        //   builder: ((context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Scaffold(
        //         body: Center(
        //           child: SpinKitSpinningLines(
        //             color: Color(0xffDB6C16),
        //             size: 90.0,
        //           ),
        //         ),
        //       );
        //     } else if (snapshot.hasData) {
        //       return Scaffold(
        //           floatingActionButton: Container(
        //             height: 70.0,
        //             width: 130.0,
        //             decoration: BoxDecoration(
        //               boxShadow: [
        //                 BoxShadow(
        //                     color: Colors.grey, //New
        //                     blurRadius: 20.0,
        //                     offset: Offset(0, 1))
        //               ],
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(30.0),
        //             ),
        //             child: Center(
        //               child: Text(
        //                 "Add",
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(fontSize: 18.0),
        //               ),
        //             ),
        //           ),
        //           appBar: AppBar(
        //             backgroundColor: Colors.transparent,
        //             elevation: 0,
        //             foregroundColor: Colors.black,
        //             title: Text("Select ingredients 🥗🌶️"),
        //             leading: IconButton(
        //               icon: Icon(
        //                 Icons.close,
        //                 size: 30.0,
        //               ),
        //               color: Colors.black,
        //               onPressed: () async {
        //                 context.pop();
        //               },
        //             ),
        //           ),
        //           body: SafeArea(
        //             top: true,
        //             child: Padding(
        //               padding: const EdgeInsets.all(10.0),
        //               child: Container(),
        //               // ListView.separated(
        //               //   reverse: true,
        //               //   itemBuilder: (context, index) {
        //               //     final ingredients = snapshot.data[index];
        //               //     IngredientsScreen.ingredients = ingredients.title;
        //               //     return IngredientContainer(
        //               //       name: ingredients.title!,
        //               //       date: ingredients.useBy!,
        //               //     );
        //               //   },
        //               //   separatorBuilder: (BuildContext context, int index) =>
        //               //       const Divider(),
        //               //   itemCount: data.length,
        //               // ),
        //             ),
        //           ));
        //     } else {
        //       return Scaffold(
        //         appBar: AppBar(
        //           backgroundColor: Colors.transparent,
        //           elevation: 0,
        //           foregroundColor: Colors.black,
        //           leading: IconButton(
        //             icon: Icon(
        //               Icons.close,
        //               size: 30.0,
        //             ),
        //             color: Colors.black,
        //             onPressed: () async {
        //               context.pop();
        //             },
        //           ),
        //         ),
        //         body: Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Lottie.asset("images/somethingerror.json"),
        //               Text(
        //                 "Something went wrong,check your internet and please try again",
        //                 style: TextStyle(
        //                     color: Colors.grey,
        //                     fontSize: 16.0,
        //                     fontWeight: FontWeight.w500),
        //                 textAlign: TextAlign.center,
        //               )
        //             ],
        //           ),
        //         ),
        //       );
        //     }
        //   }),
        // );

        ref.watch(ingredientControllerProvider).ingredients.when(
              data: (List<GetIngridentResponseModel> data) => Scaffold(
                  floatingActionButton: FloatingActionButton.extended(
                      backgroundColor: Color(0xffEF2D5A),
                      onPressed: () {},
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
                            IngredientsScreen.ingredients = ingredients;
                            return IngredientContainer(
                              name: ingredients.title!,
                              date: ingredients.useBy!,
                              isSelected:
                                  selectedItems.contains(ingredients.title),
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
                    color: Color(0xffDB6C16),
                    size: 90.0,
                  ),
                ),
              ),
            );
  }
}
