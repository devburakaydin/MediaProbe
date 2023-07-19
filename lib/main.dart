import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediaprobe/bindings/home_view_binding.dart';
import 'package:mediaprobe/constants/theme.dart';
import 'package:mediaprobe/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Media Probe',
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.theme,
      initialBinding: InitialBinding(),
      home: const HomeView(),
    );
  }
}
