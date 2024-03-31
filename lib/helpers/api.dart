import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> get({required String url}) async {
    try {
      var response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      }
    } on Exception catch (e) {
      throw Exception('An error has occured: $e');
    }
  }
}
