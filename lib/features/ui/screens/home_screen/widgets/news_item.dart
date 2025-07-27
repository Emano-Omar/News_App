import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/routing/routes.dart';
import '../../../../data/models/articles.dart';
import 'custom_sized_box.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 10.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.grey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
                color: Colors.grey)),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                articles.imageNewsUrl?.isNotEmpty == true
                                    ? articles.imageNewsUrl!
                                    : "https://static.vecteezy.com/system/resources/previews/000/198/210/original/breaking-news-background-with-earth-planet-vector.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        const CustomSizedBox(height: 0, width: 8),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                articles.title!,
                                style: Theme.of(context).textTheme.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const CustomSizedBox(height: 5, width: 0),
                              // ignore: prefer_if_null_operators
                              Text(
                                articles.description != null
                                    ? articles.description!
                                    : "---",
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.detailsScreen,
                                        arguments: articles
                                        );
                                  },
                                  child: Text(":: Read more >>",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                      const CustomSizedBox(height: 5, width: 0),
                      Text(
                    articles.publishDate?.isNotEmpty == true ?
                    DateFormat('dd/MM/yyyy – HH:mm a').
                    format(DateTime.parse(articles.publishDate.toString()))
                    : '---',
                    style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}