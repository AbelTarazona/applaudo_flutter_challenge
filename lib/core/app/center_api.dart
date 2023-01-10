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
        HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImY1NWU0ZDkxOGE0ODY0YWQxMzUxMDViYmRjMDEwYWY5Njc5YzM0MTMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYXBwbGF1ZG8tdG9kby1hcHAiLCJhdWQiOiJhcHBsYXVkby10b2RvLWFwcCIsImF1dGhfdGltZSI6MTY3MzM2NTEyMywidXNlcl9pZCI6IllWM1BkRTRlenZkcUl3dlU5RGVFdFhXZDN4QzMiLCJzdWIiOiJZVjNQZEU0ZXp2ZHFJd3ZVOURlRXRYV2QzeEMzIiwiaWF0IjoxNjczMzY1MTIzLCJleHAiOjE2NzMzNjg3MjMsImVtYWlsIjoidGVzdEB0ZXN0LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ0ZXN0QHRlc3QuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.k1AJG1HpN3u4yXE7DpYhD2wbvENKzcxvHGFDCjFv8jienZWEDHu160TxxayEwKfARIILZPlSrdIeFLTelxtNl6MpozVDnqdRzor8131dvoPxYH0Gj7VZmKEuHbl1PbGBXJfjTWWn4eYbj1OUQ3PIAG7ng5f-gFPjZ68T-2mAlJDMgVWDLlMJARW2d8xhqnFVTrgpw-mQF97Jk55o33E2jLJPSKfbtGrP-NJxx5eHqmoY4Eljq5Bmo3i0O727R1ngKc87Iq5WG8F0kPIXwh2D1Ul3MND-RFt7PyiB5ObNEPM7Tcv24FqEgeM3nElN-_0o4Dt5vfn15_zQm81XdeQuQg'
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
