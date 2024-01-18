import 'package:get/get.dart';
import '../models/github_model.dart';

class RepositoryController extends GetxController {
  RxList<Items> repositories = <Items>[].obs;
  RxBool isLoading = true.obs;

  Future<void> fetchRepositories() async {
    try {
      isLoading.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  void sortRepositories(String sortOption) {
    if (sortOption == 'lastUpdated') {
      repositories.sort((a, b) =>
          (b.updatedAt ?? '').compareTo(a.updatedAt ?? ''));
    } else if (sortOption == 'starCount') {
      repositories.sort((a, b) =>
          (b.stargazersCount ?? 0).compareTo(a.stargazersCount ?? 0));
    }
  }
  bool get getIsLoading => isLoading.value;
}
