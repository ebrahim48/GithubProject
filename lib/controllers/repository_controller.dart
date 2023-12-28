import '../models/github_model.dart';
import '../services/github_service.dart';

class RepositoryController extends GetxController {
  final GithubService _githubService = Get.find<GithubService>();

  var repositories = <Items>[].obs;
  var isLoading = false.obs;

}
