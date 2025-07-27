import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/theme/app_themes.dart';
import 'core/routing/routes.dart';
import 'features/ui/widgets/drawer/logic/cubit/theme_cubit.dart';
import 'features/ui/widgets/drawer/logic/cubit/theme_states.dart';

class NewsApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isDark;

  const NewsApp({super.key, required this.appRouter, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..changeAppTheme(fromShared: isDark),

      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          ThemeCubit theme = BlocProvider.of<ThemeCubit>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: theme.isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        },
      ),
    );
  }
}