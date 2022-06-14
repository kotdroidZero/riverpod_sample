import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_sample/app/core/base/base_api_provider.dart';

class ApiRepository extends BaseRepository {
  /// Get request
   @protected
   Future<Response> getApi(String url) async {
    return await dioClient.get(url);
  }

  /// POST request
  @protected
  Future<Response> postApi(Map data, String url) async {
    return await dioClient.post(url, data: data);
  }
}
