import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/github_model.dart';
import '../services/github_service.dart';


class RepositoryController extends GetxController {
  final GithubService _githubService = GithubService();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  var repositories = <Items>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {

      var githubRepositories = await _githubService.getRepositories('Flutter');


      await _databaseHelper.insertRepositories(githubRepositories.items!);

      repositories.assignAll(githubRepositories.items!);
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
