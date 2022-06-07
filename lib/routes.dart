import 'package:flutter/material.dart';
import 'package:jokes_api/home_page.dart';
import 'package:jokes_api/pages/music_page.dart';
import 'package:jokes_api/pages/program_page.dart';
import 'package:jokes_api/pages/pun_page.dart';
import 'package:jokes_api/pages/spooky_page.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProgramPage.routeName:
        return MaterialPageRoute(builder: (context) => const ProgramPage());
      case PunPage.routeName:
        return MaterialPageRoute(builder: (context) => const PunPage());
      case MusicPage.routeName:
        return MaterialPageRoute(builder: (context) => const MusicPage());
      case SpookyPage.routeName:
        return MaterialPageRoute(builder: (context) => const SpookyPage());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
