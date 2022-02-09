// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wincoremobile/application/register/cubit/register_cubit.dart';
import 'package:wincoremobile/domain/model/register/register_request.dart';
import 'package:wincoremobile/domain/model/register/register_response.dart';
// import 'package:wincoremobile/domain/model/token_response.dart';
// import 'package:wincoremobile/repository/token_repository.dart';
// import 'package:flutter/foundation.dart';

class RegisterRepository {
  final Dio _dio = Dio();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyMobileNumber({
    required String phoneNumber,
  }) async {
    return _auth.verifyPhoneNumber(
      phoneNumber: '+62' + phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        OTPSuccessState(phoneAuthCredential.smsCode.toString());
        //signInWithPhoneAuthCredential(phoneAuthCredential);
      },
      verificationFailed: (verificationFailed) async {
        RegisterErrorState(verificationFailed.message.toString());
        // _scaffoldKey.currentState!
        //     .showSnackBar(SnackBar(content: Text(verificationFailed.message!)));
      },
      codeSent: (verificationId, resendingToken) async {
        // setState(() {
        //   showLoading = false;
        //   currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
        //   this.verificationId = verificationId;
        // });
        OTPSentState(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  // Future<>
  Future<Either<String, RegisterResponse>> registerNewUser({
    required String token,
    required RegisterRequest registerRequest,
  }) async {
    Response _response;
    // Response _tokenResponse;

    try {
      // print(token.toString());
      // print(registerRequest.toJson().toString());

      Map<String, dynamic> requestData = {
        "message": """{
            "accountno": ${registerRequest.accountno.toString()},
            "identityno": ${registerRequest.identityno.toString()},
            "birthdate": ${registerRequest.birthdate.toString()},
            "username": ${registerRequest.username.toString()},
            "password": ${registerRequest.password.toString()},
            "mpin": ${registerRequest.mpin.toString()},
            "phonenum": ${registerRequest.phonenum.toString()}
          }""",
      };

      _response = await _dio.post(
        "https://103.2.146.173:8443/mobileservice/Register",
        // data: {
        //   "message": registerRequest.toJson().toString()
        // },
        // data: {
        //   "message": """{
        //     "accountno": ${registerRequest.accountno.toString()},
        //     "identityno": ${registerRequest.identityno.toString()},
        //     "birthdate": ${registerRequest.birthdate.toString()},
        //     "username": ${registerRequest.username.toString()},
        //     "password": ${registerRequest.password.toString()},
        //     "mpin": ${registerRequest.mpin.toString()},
        //     "phonenum": ${registerRequest.phonenum.toString()}
        //   }"""
        // },
        data: requestData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );
      print(_response);

      RegisterResponse registerResponse =
          RegisterResponse.fromJson(_response.data);

      //right itu untuk sukses
      return right(registerResponse);
    } on DioError catch (e) {
      //error dari dio
      var errorMessage = e.response?.data.toString();

      // print("status code : ");
      // print(e.response?.statusCode);
      print(e.response?.data);
      // print(e.response?.headers);
      // print(e.response?.requestOptions);
      // print(e.response?.statusCode);
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.other:
          // Dio Error Handler
          errorMessage = e.message;
          break;
      }
      //left itu untuk error
      return left(errorMessage.toString());
    }
  }
}
