import 'package:flutter/material.dart';
import 'package:riverpod_demo/core/routes/route_name.dart';
import 'package:riverpod_demo/view/image_screen.dart';

class AppRoutes {

  static Map<String, WidgetBuilder> routes = {
    RouteName.home : (_) => ImageScreen(),
    //RouteName.reel: (_) => ReelScreen(category: '',)

  };


}
