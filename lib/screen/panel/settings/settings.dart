import 'package:flutter/material.dart';
import 'package:wincoremobile/screen/auth/change_mpin/change_mpin.dart';
import 'package:wincoremobile/screen/auth/change_password/change_password.dart';
import 'package:wincoremobile/screen/auth/sign_in/sign_in.dart';
import 'package:wincoremobile/helper/icon_with_label.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.blue,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword()));
              },
              child: const HorizontalFlatMenuWithIcon(
                nameMenu: 'Change Password',
                icon: Icons.lock_open_sharp,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangeMPin()));
              },
              child: const HorizontalFlatMenuWithIcon(
                nameMenu: 'Change M-PIN',
                icon: Icons.password_sharp,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const HorizontalFlatMenuWithIcon(
                nameMenu: 'Sign Out',
                icon: Icons.exit_to_app_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
