import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../controllers/repository_controller.dart';

class HomePage extends StatelessWidget {
  final RepositoryController _controller = Get.find<RepositoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repositories'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_controller.repositories.isEmpty) {
          return Center(child: Text('No repositories found.'));
        } else {
          return ListView.builder(
            itemCount: _controller.repositories.length,
            itemBuilder: (context, index) {
              final repo = _controller.repositories[index];
              return ListTile(
                title: Text(repo.name ?? ''),
                onTap: () {
                  Get.toNamed(
                    '/repositoryDetails',
                    arguments: repo,
                  );
                },
              );
            },
          );
        }
      }),
    );
  }
}
