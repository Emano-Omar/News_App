import 'package:bloc/bloc.dart';
import '../../data/models/articles.dart';
import '../../data/repositories/news_repository.dart';
import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  final NewsRepository _newsRepository;

  List<Articles> _allArticles = [];
  List<Articles> filteredArticles = [];

  NewsCubit(this._newsRepository) : super(NewsInitialState());

  Future<void> getNews() async {
    try {
      emit(NewsLoadingState());
      final news = await _newsRepository.getNews();
      _allArticles = news.articles;
      filteredArticles = List.from(_allArticles);
      emit(NewsLoadedState(news));
    } catch (e) {
      emit(NewsErrorState(e.toString()));
    }
  }

  void filterArticles(String query) {
    if (query.isEmpty) {
      filteredArticles = List.from(_allArticles);
    } else {
      filteredArticles = _allArticles.where((article) =>
          (article.title ?? '').toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
    emit(NewsFilterState(filteredArticles));
  }

  void clearFilter() {
    filterArticles('');
  }
}

