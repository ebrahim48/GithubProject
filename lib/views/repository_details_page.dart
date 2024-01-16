import 'package:flutter/material.dart';
class RepositoryDetailsPage extends StatelessWidget {
  final int repositoryId;
  RepositoryDetailsPage({required this.repositoryId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repository Details"),
      ),
      body: Center(
        child: Text("Details for Repository ID: $repositoryId"),
      ),
    );
  }
}
