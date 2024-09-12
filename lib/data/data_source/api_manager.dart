import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/sources_models.dart';

class ApiManager {
  static Future<List<Source>> fetchSourcesList(String categoryID) async {
    var url = Uri.http(Constants.domain, "/v2/top-headlines/sources",
        {"apiKey": Constants.apiKey, "category": categoryID});
    final response = await http.get(url);
    log(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      SourcesModels sourcesModels = SourcesModels.fromJson(data);
      return sourcesModels.sources;
    } else {
      throw Exception("Failed to get Sources List...");
    }
  }

  static Future<List<Artical>> fetchArticalList(String sourcesID) async {
    var url = Uri.http(
        Constants.domain
        // "newsapi.org"
        ,
        "/v2/top-headlines",
        {"apiKey": Constants.apiKey, "sources": sourcesID});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      ArticalesModel articalesModel = ArticalesModel.fromJson(data);
      return articalesModel.articles;
    } else {
      throw Exception("Failed to get Sources List...");
    }
  }
}
