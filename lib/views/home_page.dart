import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controllers/repository_controller.dart';

class HomePage extends StatelessWidget {
  final RepositoryController repositoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Repositories"),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: repositoryController.repositories.length,
          itemBuilder: (context, index) {
            var repository = repositoryController.repositories[index];
            return ListTile(
              title: Text(repository.name ?? ""),
              subtitle: Text("Stargazers: ${repository.stargazersCount}, Watchers: ${repository.watchersCount}"),
            );
          },
        ),
      ),
    );
  }
}
