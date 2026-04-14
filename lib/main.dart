import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:riverpod_demo/res/app_strings.dart';
import 'package:riverpod_demo/view/image_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, screenType, orientation) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true
          ),
          home: const ImageScreen(),
        );
      },
    );
  }
}
