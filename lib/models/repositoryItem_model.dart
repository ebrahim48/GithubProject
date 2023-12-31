class RepositoryItem {
  int? id;
  String? name;
  RepositoryItem({this.id, this.name});
  factory RepositoryItem.fromJson(Map<String, dynamic> json) {
    return RepositoryItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
