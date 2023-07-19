import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mediaprobe/constants/api_keys.dart';
import 'package:mediaprobe/models/article.dart';

class ApiService {
  ApiService._();

  static Future<List<Article>> fetchMostPopularArticles() async {
    var response = await http.get(Uri.parse(ApiKeys.mostPopularArticles));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = json.decode(response.body);
      final list = jsonMap["results"] as List;
      return list.map((e) => Article.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
