import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/repository_controller.dart';

class HomePage extends StatelessWidget {
  final RepositoryController repositoryController = Get.put(
      RepositoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repositories'),
      ),
      body: Obx(
            () =>
        repositoryController.isLoading.value
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // await repositoryController.fetchData();
              },
              child: Text('Fetch Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // repositoryController.sortRepositories('lastUpdated');
              },
              child: Text('Sort by Last Updated'),
            ),
            ElevatedButton(
              onPressed: () {
                // repositoryController.sortRepositories('starCount');
              },
              child: Text('Sort by Star Count'),
            ),

          ],
        ),
      ),
    );
  }
}