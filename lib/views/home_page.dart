import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubtask/controllers/repository_controller.dart';
import 'package:githubtask/models/github_model.dart';
import 'package:githubtask/views/repository_details_page.dart';

class HomePage extends StatelessWidget {
  final RepositoryController repositoryController = Get.put(RepositoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repositories'),
      ),
      body: Obx(
            () => repositoryController.getIsLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: repositoryController.repositories.length,
          itemBuilder: (context, index) {
            var repository = repositoryController.repositories[index];
            return ListTile(
              title: Text('Name: ${repository.name ?? 'Name'}'),
              subtitle: Text('Description: ${repository.description ?? 'Description'}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RepositoryDetailsPage(
                      repository: convertItemsToRepository(repository),
                    ),
                  ),
                );

              },
            );
          },
        ),
      ),
    );
  }

  convertItemsToRepository(Items repository) {

  }
}
