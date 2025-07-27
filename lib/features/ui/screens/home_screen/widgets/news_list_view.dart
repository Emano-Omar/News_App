import 'package:flutter/material.dart';
import '../../../../data/models/articles.dart';
import 'news_item.dart';

class NewsListView extends StatelessWidget {
  final List<Articles> newsList;

  const NewsListView({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return NewsItem(articles: newsList[index]);
      },
    );
  }
}
