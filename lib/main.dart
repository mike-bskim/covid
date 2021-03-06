import 'package:flutter/material.dart';
import 'package:flutter_covid/src/app.dart';
import 'package:flutter_covid/src/controller/covid_statistics_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(CovidStatisticsController());
      }),
      theme: ThemeData(
//        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: App(),
    );
  }
}
