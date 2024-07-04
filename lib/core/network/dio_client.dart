import 'package:dio/dio.dart';
import 'package:news/core/constants/app_constants.dart';

import 'client.dart';

class DioClient implements Client {
  final Dio _dio;
  final String _apiKey;

  DioClient(this._dio) : _apiKey = AppConstants.apiKey {
    _dio.options.baseUrl = AppConstants.url;
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Map<String, dynamic> paramsWithKey = {'apiKey': _apiKey};
      paramsWithKey.addAll(queryParameters ?? {});

      Response response = await _dio.get(
        path,
        options: Options(validateStatus: (status) => true),
        queryParameters: paramsWithKey,
      );

      final responseData = response.data;

      if (responseData["status"] != "ok") {
        throw Exception(responseData);
      }

      return responseData;
    } on DioException {
      rethrow;
    }
  }
}
