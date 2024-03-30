import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app/presentation/theme_manager.dart';
import 'package:news_app/cubit/news_cubit.dart';

import '../screens/home_screen/home_screen.dart';

class MyApp extends StatefulWidget {

  MyApp._internal();

  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
            theme:  getApplicationTheme()
          );
        },
      ),
    );
  }
}

