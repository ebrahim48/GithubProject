import 'package:get/get.dart';

import '../models/repositoryItem_model.dart';
import '../services/github_service.dart';

class RepositoryController extends GetxController {
  final GithubService _githubService = Get.find<GithubService>();

  var repositories = <RepositoryItem>[].obs;
  var isLoading = false.obs;

  Future<void> fetchRepositories(String keyword, int page) async {
    try {
      isLoading.value = true;
      var data = await _githubService.fetchRepositories(keyword, page);
      repositories.addAll(data.items! as Iterable<RepositoryItem>);
    } catch (e) {

    } finally {
      isLoading.value = false;
    }
  }
}
