import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/repositoryItem_model.dart';
import '../services/github_service.dart';

class RepositoryController extends GetxController {
  final GithubService _githubService = Get.find<GithubService>();
  final SharedPreferences _prefs = Get.find<SharedPreferences>();

  var repositories = <RepositoryItem>[].obs;
  var isLoading = false.obs;

  Future<void> fetchRepositories(String keyword, int page) async {
    try {
      isLoading.value = true;
      var data = await _githubService.fetchRepositories(keyword, page);
      repositories.addAll(data.items!.map((item) => RepositoryItem.fromJson(item)).toList());


      await _saveDataLocally(repositories.toList());
    } catch (e) {

    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveDataLocally(List<RepositoryItem> items) async {
    try {

      final jsonData = items.map((item) => item.toJson()).toList();


      await _prefs.setString('repositories', jsonEncode(jsonData));
    } catch (e) {

    }
  }

  Future<void> loadDataLocally() async {
    try {
      final storedData = _prefs.getString('repositories');
      if (storedData != null) {

        final jsonData = jsonDecode(storedData) as List<dynamic>;
        final items = jsonData.map((item) => RepositoryItem.fromJson(item)).toList();


        repositories.assignAll(items);
      }
    } catch (e) {

    }
  }
}
