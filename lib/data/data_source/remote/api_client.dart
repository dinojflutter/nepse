import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(baseUrl: Apiconstants.mainurl);
    dio = Dio(baseOptions);
  }

  Options options = Options();

  Future<Response> getRequest({
    required String path,
  }) async {
    try {
      // 404
      debugPrint("############## Api Request #############");
      debugPrint("Request Url:${baseOptions.baseUrl + path} ");
      var response = await dio.get(path, options: options);
      debugPrint("############## Api Response #############");
      debugPrint("Status Code :  ${response.statusCode.toString()}");
      // log("Response data :  ${response.data}");
      return response;

      // debugPrint(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
