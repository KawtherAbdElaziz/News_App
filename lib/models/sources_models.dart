class SourcesModels {
  final String status;
  final List<Source> sources;

  SourcesModels({required this.status, required this.sources});

  factory SourcesModels.fromJson(Map<String, dynamic> json) => SourcesModels(
      status: json["status"],
      sources: (json["sources"] as List).map((element) {
        return Source.fromJson(element);
      }).toList());
}

class Source {
  final String name;
  final String id;

  Source({required this.name, required this.id});

  factory Source.fromJson(Map<String, dynamic> json) =>
      Source(name: json["name"], id: json["id"]);
}
