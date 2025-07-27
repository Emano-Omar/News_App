import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/shred_pref_constants.dart';
import 'package:news_app/core/helpers/shered_pref_helper.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'news_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isDark = await SharedPrefHelper.getBool(SharedPrefKeys.isDark);
  runApp(NewsApp(isDark: isDark, appRouter: AppRouter()));
}




