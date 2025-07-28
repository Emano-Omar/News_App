import 'package:dio/dio.dart';
import '../api_constants.dart';
import '../models/news.dart';

class NewsWebService {
  late Dio dio;

  NewsWebService(){
    BaseOptions options = BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        receiveDataWhenStatusError: true,
        baseUrl: baseUrl,
    );

    dio = Dio(options);
  }

  Future<News?> getNews() async {
    try {
      Response response = await dio.get(
          path,
          queryParameters: {
            'category': category,
            'country': country,
            'apiKey': apiKey,
          }
      );

     if (response.statusCode == 200){
       return News.fromJson(response.data);
     }
    else {
       return null;
     }

    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
