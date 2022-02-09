import 'package:flutter/material.dart';

class AccountActivities extends StatefulWidget {
  const AccountActivities({Key? key}) : super(key: key);

  @override
  State<AccountActivities> createState() => _AccountActivitiesState();
}

class _AccountActivitiesState extends State<AccountActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saving Account Activities"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
