import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'globEnv.dart';

class QaApi {

  final String code = 'code';
  final dio = Dio();

  Future<String> parse(String responseBody, String dataName) async {
    return jsonDecode(responseBody)[dataName];
  }

  Future<String> sendGet(String endpoint, String dataName) async {
    Response response;
    String data = '';

    try {
      dio.options.headers["token"] = GlobEnv.dbKey;
      response = await dio.get(
        GlobEnv.iosDbStage + endpoint,
      );

      log(response.data.toString());
      data = await parse(response.data.toString(), dataName);
    } on DioError catch (e){
      log('Exception details:\n $e');
    }

    return data;
  }

  Future<String> sendPost(String endpoint, Map<String, String> body, String dataName) async {
    Response response;
    String data = '';

    try {
      dio.options.headers["token"] = GlobEnv.dbKey;
      response = await dio.post(
        GlobEnv.iosDbStage + endpoint,
        data: body,
      );

      log(response.data.toString());
      data = await parse(response.data.toString(), dataName);
    } on DioError catch (e){
      log('Exception details:\n $e');
    }

    return data;
  }

  /// Generate fixed amount voucher.
  ///
  /// @return voucher
  Future<String> generateFixedAmountVoucher(String sum) async {
    var body = {"sum": sum};
    final String voucher = await sendPost("e2e-tests/vouchers", body, code);

    return voucher;
  }

  /// Generate percentage voucher.
  ///
  /// @return String
  Future<String> generatePercentageVoucher(String percent, int promotion) async {
    var body = {"type": "percent", "value": percent, "is_promotion": promotion.toString()};
    final String voucher = await sendPost("e2e-tests/vouchers", body, code);

    return voucher;
  }

  /// Toggle voucher activity.
  ///
  /// @return String
   Future<String> toggleVoucherActivity(String voucher, bool isActive) async {
     var body = {code: voucher};
     final String status = await sendPost("e2e-tests/vouchers/toggle", body, isActive.toString());

     return status;
  }
}