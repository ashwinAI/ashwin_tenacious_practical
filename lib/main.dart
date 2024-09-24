import 'package:ashwin_practical/home_view/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: HomeView.routes,
          page: () => const HomeView(),
          binding: HomeBinding(),
        )
      ],
      home: const HomeView(),
      initialRoute: HomeView.routes,
      initialBinding: HomeBinding(),
    );
  }
}
