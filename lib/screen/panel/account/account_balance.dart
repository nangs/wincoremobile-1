import 'package:flutter/material.dart';

class AccountBalance extends StatefulWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informasi Saldo"),
        backgroundColor: const Color(0xff120A7C),
      ),
    );
  }
}
