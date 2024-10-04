import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/initial/page/initial_page.dart';
import 'package:fastlocation/src/modules/home/page/home_page.dart';
import 'package:fastlocation/src/modules/history/page/history_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const InitialPage(),
    '/home': (context) => HomePage(),
    '/history': (context) => HistoryPage(),
  };
}
