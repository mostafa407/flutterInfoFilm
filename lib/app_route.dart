import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfilm/views/screens/LoginPage.dart';
import 'package:flutterfilm/views/screens/character_details.dart';
import 'package:flutterfilm/views/screens/homePage.dart';

import 'core/constant/endPoint.dart';
import 'data/models/characer.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EndPoint.homePage:
        return MaterialPageRoute(builder: (_) => Loginpage());
      case EndPoint.characterScreen:
        return MaterialPageRoute(builder: (_) => const Homepage());
      case EndPoint.characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => CharacterDetailsScreen(character: character),
        );
      default:
        return null;
    }
  }
}
