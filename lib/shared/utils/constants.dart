import 'package:dio/dio.dart';

class Constants {
  static String apiUrl = 'insert api key here';

  static String userToken = '';

  static Options get dioOptions {
    return Options(headers: {
      'authorization': 'Bearer $userToken',
    });
  }
}
