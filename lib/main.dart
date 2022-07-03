import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wester_ops_case/model/nasa_modelll.dart';
import 'package:wester_ops_case/pages/home_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NasaModelAdapter());
  await Hive.openBox('rovers');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
