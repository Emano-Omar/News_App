import 'package:news_app/features/data/models/articles.dart';
import '../../data/models/news.dart';

abstract class NewsStates {}
  class NewsInitialState extends NewsStates{}

class NewsLoadingState extends NewsStates{}
  class NewsLoadedState extends NewsStates
  {
    final News news;
    NewsLoadedState(this.news);
  }
  class NewsErrorState extends NewsStates
  {
    final String error;
    NewsErrorState(this.error);
  }

  class NewsFilterState extends NewsStates{
    final List<Articles> filteredArticles;
    NewsFilterState(this.filteredArticles);
  }


