import 'owner_model.dart';
class GithubModel {
  int? totalCount;
  bool? incompleteResults;
  List<Items>? items;

  GithubModel({this.totalCount, this.incompleteResults, this.items});

  factory GithubModel.fromJson(Map<String, dynamic> json) {
    return GithubModel(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: json['items'] != null
          ? List<Items>.from(json['items'].map((x) => Items.fromJson(x)))
          : null,
    );
  }
}

class Items {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  Owner? owner;
  String? htmlUrl;
  String? description;
  int? stargazersCount;
  String? updatedAt;

  Items({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.htmlUrl,
    this.description,
    this.stargazersCount,
    this.updatedAt,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      htmlUrl: json['html_url'],
      description: json['description'],
      stargazersCount: json['stargazers_count'],
      updatedAt: json['updated_at'],
    );
  }
}