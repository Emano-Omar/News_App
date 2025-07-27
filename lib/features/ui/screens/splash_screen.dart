import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/data/repositories/news_repository.dart';
import 'package:news_app/features/data/web_services/news_web_service.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../../logic/news_cubit/news_cubit.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    _setSystemUI();
  }

  void _setSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
  static const int splashDuration = 4000;
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: BlocProvider(create: (BuildContext context) =>
          NewsCubit(NewsRepository(NewsWebService())),child: HomeScreen(),),

        duration: splashDuration,
        imageSize: 600,
        imageSrc: "assets/images/splash_screen.png",
        text: "Breaking News ",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold),
          colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}