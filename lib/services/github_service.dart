import 'package:dio/dio.dart';

import '../models/github_model.dart';


class GithubService {
  final Dio _dio = Dio();

  Future<GithubModel> getRepositories(String query) async {
    try {
      Response response = await _dio.get(
        "https://api.github.com/search/repositories?q=$query",
      );
      return GithubModel.fromJson(response.data);
    } catch (error) {
      throw error;
    }
  }
}
