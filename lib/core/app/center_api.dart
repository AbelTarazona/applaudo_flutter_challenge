import 'dart:convert';
import 'dart:io';

import 'package:chuck_interceptor/chuck.dart';
import 'package:http/http.dart' as http;
import 'package:todo/core/app/flavor.dart';
import 'package:todo/core/app/global_store.dart';
import 'package:todo/core/app/injection_container.dart';
import 'package:todo/core/app/server_response.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/core/utils/constants.dart';

class CenterApi {
  Map<String, String> get _headers {
    String token = GlobalStore.instance.apiToken;
    return {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${AppConstant.bearerToken}'
    };
  }

  Future<ServerResponse> get({required String urlSpecific}) async {
    try {
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);

      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }

      final dataDecode = response.body != ''
          ? AppUtils.instance.getDataDecode(response.bodyBytes)
          : [];

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ServerResponse(
          isSuccess: true,
          message: "GET Exitoso",
          result: dataDecode,
          statusCode: response.statusCode,
        );
      } else {
        return ServerResponse(
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
        statusCode: -99,
      );
    }
  }

  Future<ServerResponse> post({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.post(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: 'POST exitoso',
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> update({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = json.encode(data);
      final response = await http.put(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: "PUT exitoso",
          result: dataDecode,
        );
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  String formatError(dynamic error) {
    if (error is Map) {
      if (error.containsKey('message')) return error['message'].toString();
      return 'Error';
    }
    return AppConstant.error;
  }
}
