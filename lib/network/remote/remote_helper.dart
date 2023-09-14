import 'package:dio/dio.dart';

class MovieDioHelper {
  static Dio? dio;

  static void initMovie() async {
    dio = await Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/movie/',
      receiveDataWhenStatusError: true,
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
    ));
  }

  static Future<Response> GetData({required String url, Map<String,dynamic>? query}) async {
    return await dio!.get(url,queryParameters:query);
  }
}
class SimilarMoviDioHelper {
  static Dio? dio;

  static void initMovie() async {
    dio = await Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/tv/',
      receiveDataWhenStatusError: true,
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
    ));
  }

  static Future<Response> GetData({required String url}) async {
    return await dio!.get(url);
  }
}
class SearchDioHelper {
  static Dio? dio;

  static void initSearch() async {
    dio = await Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/search/',
      receiveDataWhenStatusError: true,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
    ));
  }

  static Future<Response> GetData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio!.get(url, queryParameters: query);
  }
}
class WatchListDioHelper {
  static Dio? dio;

  static void initWatchList() async {
    dio = await Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/account/',
      receiveDataWhenStatusError: true,
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZjljNmZjNTFkZjNjZDlkMjExYjI5NzJiNjUzZTA5MiIsInN1YiI6IjY0ZmEyNDRjNzk4ZTA2MDBjNTQwMTQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.85yQlhr6FW70XbwgbLQIQSTrl2AYODecVqq1O1QIxMg',
        'Accept': 'application/json',
      },
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
    ));
  }
  static Future<Response> GetData(
      {required String url}) async {
    return await dio!.get(url);
  }
  static Future<Response> PostData(
      {required String url,required Map<String,dynamic> data}) async {
    return await dio!.post(url,data:data);
  }
}