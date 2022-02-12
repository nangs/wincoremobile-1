// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, camel_case_types

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
                  // height: 90,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "No Rekening : " + widget.no_rek,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text("Periode : ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(widget.startDate,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(" - ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(widget.endDate,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Tanggal Inquiry : " +
                                    DateFormat("yyyy/MM/dd")
                                        .format(DateTime.now()),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          accActivityDetails(),
                          accActivityDetails(),
                          accActivityDetails(),
                          accActivityDetails(),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Sebelumnya")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Selanjutnya")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class accActivityDetails extends StatelessWidget {
  const accActivityDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "2022/01/02 - 11:42:21",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Transfer ke VISIONET INTERNATIONAL 39358087777571863",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Ref No : B2100000000496",
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "IDR 171.863,00",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "D",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.all(8),
          // padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        )
      ],
    );
  }
}
