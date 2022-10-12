import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;

  

  DioConsumer({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dio) {
      dio.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dio;
    };

    dio.options
      ..baseUrl = ApiConstatnt.baaseUrl
      ..responseType = ResponseType.plain
      ..contentType = ApiConstatnt.applicationJson
      ..followRedirects = false
      // ..validateStatus = (status) {
//return status! < StatusCode.internalServerError;
      //  }
      ..headers = {ApiConstatnt.authorization: ApiConstatnt.token}
      ..queryParameters = {
        //ApiConstatnt.page: 3,
        //  ApiConstatnt.dateGte: _dataTime
      };

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    final data = _handleResponseAsJson(response);
    return data;
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body);
    return _handleResponseAsJson(response);
  }

  @override
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response =
        await dio.put(path, queryParameters: queryParameters, data: body);
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson(dynamic response) {
    final responseJson = jsonDecode(response.toString());
    return responseJson;
  }


}
