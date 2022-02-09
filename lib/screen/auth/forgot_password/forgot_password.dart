import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/auth/welcome.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final myPhoneNumberController = TextEditingController();

  final myAccountNumberController = TextEditingController();

  final myPasswordController = TextEditingController();

  final myPassword2Controller = TextEditingController();

  late String nPhoneNumber, nPassword, nAccountNumber = '', nPassword2 = '';

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Forgot Password'),
        // backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
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
                    labelText: 'New Password',
                  ),
                  onChanged: (text) {
                    nPassword = text;
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
                    labelText: 'Retype New Password',
                  ),
                  onChanged: (text) {
                    nPassword2 = text;
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
              onPressed: () {
                //aksi pindah
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Welcome()));
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
