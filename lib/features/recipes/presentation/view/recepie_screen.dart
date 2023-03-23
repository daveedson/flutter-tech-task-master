import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tech_task/features/recipes/domain/model/recipe_response_model.dart';
import 'package:tech_task/features/recipes/presentation/controller/reciepe_controller.dart';

class ReciepeScreen extends ConsumerStatefulWidget {
  const ReciepeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReciepeScreenState();
}

class _ReciepeScreenState extends ConsumerState<ReciepeScreen> {
  @override
  void initState() {
        WidgetsBinding.instance.addPostFrameCallback((_) =>
        ref.read(reciepeControllerProvider.notifier).getAllReciepe());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(reciepeControllerProvider).reciepe.when(
          data: (List<RecipeResponseModel> data)=> Scaffold(),
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
