import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gorouter = ref.watch(goRouterProvider);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: gorouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
    );
  }
}
