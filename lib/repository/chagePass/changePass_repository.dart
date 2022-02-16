// ignore_for_file: avoid_print, unnecessary_new

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_request.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_response.dart';

class PassRepository {
  final Dio _dio = Dio();

  // ignore: non_constant_identifier_names
  Future<Either<String, PassResponse>> ChangesPassWithUsernameAndPassword({
    required String token,
    required PassRequest passRequest,
  }) async {
    Response _response;
    // Response _tokenResponse;

    try {
      print("tokennya : " + token);
      print("json : " + passRequest.toJson().toString());

      _response = await _dio.post(
        "https://103.2.146.173:8443/mobileservice/ChangePass",
        data: jsonDecode(jsonEncode({"message": jsonEncode(passRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      PassResponse passResponse = PassResponse.fromJson(_response.data);
      print(passResponse.status);

      //right itu untuk sukses
      return right(passResponse);
    } on DioError catch (e) {
      print("status code : ");
      print(e.response?.statusCode);
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          break;
        case DioErrorType.other:
          // Dio Error Handler
          break;
      }
      return left("dio error : " + errorMessage.toString());
    }
  }
}
