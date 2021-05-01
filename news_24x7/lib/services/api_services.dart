import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_24x7/modals/article_modals.dart';

class ApiServices {
  static Future<List<Article>> fetchNews() async {
    Response response = await get(Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=yourApiKey"));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      Map<String, dynamic> json = jsonDecode(jsonString);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't fetch articles");
    }
  }
}
