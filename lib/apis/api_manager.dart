import 'dart:convert';
import 'package:api/models/NewsData.dart';
import 'package:api/sources_responce.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=5bc010f0d27146ecaa35f85c70580982
  static Future<SourcesResponce> getSources(String id) async {
    Uri url = Uri.http("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "5bc010f0d27146ecaa35f85c70580982",
        "category":id});

    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourcesResponce sourcesResponce = SourcesResponce.fromJson(jsonFormat);
    return sourcesResponce;
  }

  static Future<NewsDataResponse> getNewsData(String sourceId) async {
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=5bc010f0d27146ecaa35f85c70580982
    Uri url = Uri.http("newsapi.org", "/v2/everything",
        { "apiKey": "5bc010f0d27146ecaa35f85c70580982",
          "sources": sourceId,
    });
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResopnse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResopnse;
  }
}
