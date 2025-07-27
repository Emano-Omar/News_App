import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routing/routes.dart';
import 'package:news_app/features/data/models/articles.dart';
import 'package:news_app/features/data/repositories/news_repository.dart';
import 'package:news_app/features/data/web_services/news_web_service.dart';
import '../../features/logic/news_cubit/news_cubit.dart';
import '../../features/ui/screens/details_screen.dart';
import '../../features/ui/screens/home_screen/home_screen.dart';
import '../../features/ui/screens/splash_screen.dart';


class AppRouter{

  late NewsRepository newsRepository;
  late NewsCubit newsCubit;

  AppRouter() {
    newsRepository = NewsRepository(NewsWebService());
    newsCubit = NewsCubit(newsRepository);
  }

  Route? generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.splashScreen:
        return MaterialPageRoute(
            builder: (_)=>
               const SplashScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (BuildContext context) => newsCubit,
              child: const HomeScreen(),
            ));


      case Routes.detailsScreen:
        final articles = settings.arguments as Articles;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(articles: articles));

      default:
        return null;
    }
  }
}