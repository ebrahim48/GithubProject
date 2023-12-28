class License {
  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  License({this.key, this.name, this.spdxId, this.url, this.nodeId});

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      key: json['key'],
      name: json['name'],
      spdxId: json['spdx_id'],
      url: json['url'],
      nodeId: json['node_id'],
    );
  }
}