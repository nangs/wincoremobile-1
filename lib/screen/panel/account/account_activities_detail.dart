// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountActivitiesDetails extends StatefulWidget {
  AccountActivitiesDetails({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.no_rek,
  }) : super(key: key);

  String startDate;
  String endDate;
  String no_rek;

  @override
  State<AccountActivitiesDetails> createState() =>
      _AccountActivitiesDetailsState();
}

class _AccountActivitiesDetailsState extends State<AccountActivitiesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutasi Saldo"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF5F3F3),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                  ),
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 4.5, 10, 4.5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("No Rekening : " + widget.no_rek),
                            ),
                            Row(
                              children: [
                                Text("Periode : "),
                                Text(widget.startDate),
                                Text(" - "),
                                Text(widget.endDate),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text("Tanggal Inquiry : " +
                                  DateFormat("yyyy/MM/dd")
                                      .format(DateTime.now())),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
