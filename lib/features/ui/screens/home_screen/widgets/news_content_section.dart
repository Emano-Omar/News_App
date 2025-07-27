import 'package:flutter/material.dart';
import 'package:news_app/features/ui/screens/home_screen/widgets/search_text_box.dart';
import '../../../../data/models/articles.dart';
import 'custom_sized_box.dart';
import 'news_list_view.dart';

class NewsContentSection extends StatelessWidget {
  final TextEditingController searchController;
  final List<Articles> filteredList;
  final VoidCallback clearSearch;
  final Function(String) filterSearchResults;

  const NewsContentSection({
    super.key,
    required this.searchController,
    required this.filteredList,
    required this.clearSearch,
    required this.filterSearchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SearchTextBox(
              controller: searchController,
              onChanged: filterSearchResults),
        ),
        Text(
          'Total Results: ${filteredList.length}',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const CustomSizedBox(height: 10, width: 0),
        Expanded(
          child: NewsListView(newsList: filteredList),
        ),
      ],
    );
  }
}
