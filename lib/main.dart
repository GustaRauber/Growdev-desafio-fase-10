import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'features/splash_screen/view/splash_screen.page.dart';
import 'shared/utils/constants.dart';
import 'shared/views/stores/theme.store.dart';

import 'theme/theme.dart';

void initSL() {
  GetIt.I.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: Constants.apiUrl),
    ),
  );
  GetIt.I.registerSingleton<ThemeStore>(ThemeStore());
}

void main() {
  initSL();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeStore = GetIt.I.get<ThemeStore>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Nikel',
        debugShowCheckedModeBanner: false,
        themeMode: themeStore.themeMode,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: const SplashScreenPage(),
      );
    });
  }
}
