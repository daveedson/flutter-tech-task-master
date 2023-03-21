import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tech_task/app.dart';

void main() => runApp(
      MyApp(),
    );

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio(BaseOptions(
    baseUrl: "https://ubenwa-cat-api-stage.herokuapp.com/",
    connectTimeout: Duration(milliseconds: 30000),
  ));
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  return dio;
});
