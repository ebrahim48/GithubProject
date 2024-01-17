import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubtask/views/home_page.dart';

import 'controllers/repository_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final RepositoryController repositoryController = Get.put(RepositoryController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repositories App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
