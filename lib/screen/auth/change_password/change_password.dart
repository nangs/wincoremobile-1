import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late String nPhoneNumber,
      nNewPassword,
      nOldPassword,
      nAccountNumber,
      nRePassword;

  final myPhoneNumberController = TextEditingController();
  final myAccountNumberController = TextEditingController();
  final myOldPasswordController = TextEditingController();
  final myNewPasswordController = TextEditingController();
  final myRePasswordController = TextEditingController();

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Change Password'),
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
                  controller: myOldPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'OLD Password',
                  ),
                  onChanged: (text) {
                    nOldPassword = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  obscureText: true,
                  controller: myNewPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                  ),
                  onChanged: (text) {
                    nNewPassword = text;
                  },
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  style: const TextStyle(fontSize: 18.0),
                  obscureText: true,
                  controller: myRePasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Retype New Password',
                  ),
                  onChanged: (text) {
                    nRePassword = text;
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
                    MaterialPageRoute(builder: (context) => const Home()));
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
