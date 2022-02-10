// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Henry Wijaya",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("5271119926")
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      const BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Saldo anda :",
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              "Rp " + "250.000,00",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
