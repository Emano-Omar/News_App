import 'package:news_app/features/data/models/articles.dart';

class News {
  late String status;
  late int totalResults;
  late List<Articles> articles;

  News.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    articles = (json['articles'] as List).map((article) => Articles.fromJson(article)).toList();
  }

}

