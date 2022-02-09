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
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Lupa M-PIN'),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    style: const TextStyle(fontSize: 18.0),
                    controller: myPhoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nomor Telepon',
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
                      labelText: 'Nomor Telepom',
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
                      labelText: 'M-PIN Baru',
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
                      labelText: 'Ketikan Ulang M-PIN Baru',
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
                  'Kirim',
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
