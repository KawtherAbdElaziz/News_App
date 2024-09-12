class ArticalesModel {
  final String status;
  final List<Artical> articles;

  ArticalesModel({required this.status, required this.articles});

  factory ArticalesModel.fromJson(Map<String, dynamic> json) => ArticalesModel(
        status: json["status"],
        articles: List.from(json["articles"]).map((data) {
          return Artical.fromJson(data);
        }).toList(),
      );
}

class Artical {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Artical({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Artical.fromJson(Map<String, dynamic> json) => Artical(
        author: json["source"]["name"],
        // Maps the source name
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
      );
}
