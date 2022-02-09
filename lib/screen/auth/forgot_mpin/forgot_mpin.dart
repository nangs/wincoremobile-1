import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/auth/welcome.dart';

class ForgotMPin extends StatefulWidget {
  const ForgotMPin({Key? key}) : super(key: key);

  @override
  State<ForgotMPin> createState() => _ForgotMPinState();
}

class _ForgotMPinState extends State<ForgotMPin> {
  final myPhoneNumberController = TextEditingController();

  final myAccountNumberController = TextEditingController();

  final myNewMPINController = TextEditingController();

  final myRetypeNewMPINController = TextEditingController();

  late String nPhoneNumber, nNewMPIN, nAccountNumber, nRetypeNewMPIN;

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Forgot MPIN'),
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
                  controller: myNewMPINController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New MPIN',
                  ),
                  onChanged: (text) {
                    nNewMPIN = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  obscureText: true,
                  controller: myRetypeNewMPINController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Retype New MPIN',
                  ),
                  onChanged: (text) {
                    nRetypeNewMPIN = text;
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
