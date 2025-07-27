import 'package:news_app/features/data/web_services/news_web_service.dart';
import '../models/news.dart';

class NewsRepository
{
  final NewsWebService _newsWebService;
  NewsRepository(this._newsWebService);

  Future<News> getNews() async {
    return _newsWebService.getNews();
  }
}