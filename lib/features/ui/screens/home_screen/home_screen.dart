import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/ui/screens/home_screen/widgets/news_content_section.dart';
import '../../../logic/news_cubit/news_cubit.dart';
import '../../../logic/news_cubit/news_states.dart';
import '../../widgets/drawer/ui/drawer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsCubit>().getNews();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (state is NewsErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error in Fetching News!')),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<NewsCubit>();

        return Scaffold(
          appBar: AppBar(title: const Text('Latest News')),
          drawer: const DrawerItem(),
          body: state is NewsLoadingState
              ? const Center(child: CircularProgressIndicator())
              : NewsContentSection(
                searchController: searchController,
                filteredList: cubit.filteredArticles,
                clearSearch: cubit.clearFilter,
                filterSearchResults: cubit.filterArticles,
          ),
        );
      },
    );
  }
}
