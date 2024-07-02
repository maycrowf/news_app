import 'package:dio/dio.dart';
import 'package:news/core/api/api_interface.dart';

class MainApi implements ApiInterface {
  final Dio _dio;

  const MainApi({required Dio dio}) : _dio = dio;

  static const _url = "https://newsapi.org/v2";
  static const _apiKey = "0f32c255f1df438cbe03f4f184a6864c";

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Map<String, dynamic> paramsWithKey = {'apiKey': _apiKey};
      paramsWithKey.addAll(queryParameters ?? {});

      Response response = await _dio.get(
        "$_url$path",
        options: Options(validateStatus: (status) => true),
        queryParameters: paramsWithKey,
      );

      final responseData = response.data;

      if (responseData["status"] != "ok") {
        throw Exception(responseData);
      }

      return responseData;
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    }
  }
}
