import 'package:attune/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:acr_cloud_sdk/acr_cloud_sdk.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/home.dart';


void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attune',
      home: HomePage(),
    );
  }
}

