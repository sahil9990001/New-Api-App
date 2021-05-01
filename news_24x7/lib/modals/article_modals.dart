// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:news_24x7/modals/source_modals.dart';

// News newsFromJson(String str) => News.fromJson(json.decode(str));

// String newsToJson(News data) => json.encode(data.toJson());

// class News {
//   News({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });

//   String status;
//   int totalResults;
//   List<Article> articles;

//   factory News.fromJson(Map<String, dynamic> json) => News(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//       };
// }

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"] as String,
        title: json["title"] as String,
        description: json["description"] as String,
        url: json["url"] as String,
        urlToImage: json["urlToImage"] as String,
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] as String,
      );

  // Map<String, dynamic> toJson() => {
  //       "source": source.toJson(),
  //       "author": author == null ? null : author,
  //       "title": title,
  //       "description": description,
  //       "url": url,
  //       "urlToImage": urlToImage,
  //       "publishedAt": publishedAt.toIso8601String(),
  //       "content": content,
  //     };
}
