import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfilm/controller/character/character_cubit.dart';
import 'package:flutterfilm/data/repository/character_repository.dart';
import 'package:flutterfilm/data/web_service/web_service.dart';

import 'app_route.dart';

void main() {
  runApp(MyApp(appRoute: AppRoute()));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;

  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (_) => CharacterCubit(CharactersRepository(CharacterWebService())),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoute.generateRoute,
        ),
      ),
    );
  }
}
