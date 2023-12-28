class Owner {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;

  Owner({this.login, this.id, this.nodeId, this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
    );
  }
}
