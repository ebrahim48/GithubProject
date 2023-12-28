import 'package:flutter/material.dart';
import 'package:githubtask/services/github_service.dart';
import 'package:githubtask/views/home_page.dart';



import 'controllers/repository_controller.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(GithubService());
        Get.put(RepositoryController());
      }),
      home: HomePage(),
    );
  }
}