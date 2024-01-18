import 'package:flutter/material.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final Repository repository;

  RepositoryDetailsPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${repository.name}'),
            Text('Description: ${repository.description}'),
            Text('Last Update: ${repository.lastUpdate.toString()}'),
            Text('Owner: ${repository.owner.name}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

class Repository {
  final String name;
  final String description;
  final DateTime lastUpdate;
  final Owner owner;

  Repository({
    required this.name,
    required this.description,
    required this.lastUpdate,
    required this.owner,
  });
}

class Owner {
  final String name;

  Owner({required this.name});
}

