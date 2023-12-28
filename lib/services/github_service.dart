import 'package:dio/dio.dart';

import '../models/github_model.dart';

class GithubService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.github.com';

  Future<GithubModel> fetchRepositories(String keyword, int page) async {
    try {
      final response = await _dio.get(
        '$baseUrl/search/repositories',
        queryParameters: {
          'q': keyword,
          'page': page,
          'per_page': 10,
        },
      );

      if (response.statusCode == 200) {
        return GithubModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch repositories');
      }
    } catch (e) {
      throw Exception('Failed to fetch repositories: $e');
    }
  }
}
