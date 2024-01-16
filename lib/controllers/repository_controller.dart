import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../database/database_helper.dart';
import '../models/github_model.dart';
import '../services/github_service.dart';

class RepositoryController extends GetxController {
  var repositories = <Items>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await GithubService().getRepositories("Flutter");
      repositories.assignAll(response.items!);
      await DatabaseHelper().insertRepositories(response.items!);
        } catch (error) {
      print("Error: $error");
      repositories.assignAll(await DatabaseHelper().getRepositories());
    }
  }
}
