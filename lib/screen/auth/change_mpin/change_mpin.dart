// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wincoremobile/domain/model/token_response.dart';
// import 'package:wincoremobile/repository/token_repository.dart';
// import 'package:wincoremobile/screen/panel/home/home.dart';

class ChangeMPin extends StatefulWidget {
  const ChangeMPin({Key? key}) : super(key: key);

  @override
  State<ChangeMPin> createState() => _ChangeMPinState();
}

class _ChangeMPinState extends State<ChangeMPin> {
  final myPhoneNumberController = TextEditingController();

  final myAccountNumberController = TextEditingController();

  final myPasswordController = TextEditingController();

  final myPassword2Controller = TextEditingController();

  late String nPhoneNumber, nMPIN1, nAccountNumber = '', nMPIN2 = '';

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Change M-PIN'),
        // backgroundColor: Colors.lightBlue,
      ),
      body:
          //SafeArea(child: child)
          SafeArea(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  controller: myPhoneNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  onChanged: (text) {
                    nPhoneNumber = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  controller: myAccountNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Number',
                  ),
                  onChanged: (text) {
                    nAccountNumber = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  obscureText: true,
                  controller: myPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New MPIN',
                  ),
                  onChanged: (text) {
                    nMPIN1 = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  obscureText: true,
                  controller: myPassword2Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Retype New MPIN',
                  ),
                  onChanged: (text) {
                    nMPIN2 = text;
                  },
                )),
            const SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 180.0,
              height: 50.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () async {
                // //aksi pindah
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Home()));
                Response _response;
                Dio _dio = Dio();
                // _response = await _dio.get(
                //   "https://103.2.146.173:8443/mobileservice/GetToken",
                //   // data: requestData,
                //   //data: {'win_token': 'wincore'},
                //   // options: Options(
                //   //   contentType: Headers.formUrlEncodedContentType,
                //   // ),
                // );

                _response = await _dio.request(
                  'https://103.2.146.173:8443/mobileservice/GetToken',
                  options:
                      Options(method: 'GET', headers: {'win_token': 'wincore'}),
                );

                print(_response.data);

                TokenResponse tokenResponse =
                    TokenResponse.fromJson(_response.data);
                print(tokenResponse.request_token);
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
