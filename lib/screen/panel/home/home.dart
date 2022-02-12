// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, sized_box_for_whitespace, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wincoremobile/screen/panel/account/account_activities.dart';
import 'package:wincoremobile/screen/panel/account/account_balance.dart';
import 'package:wincoremobile/screen/panel/account/transfer_balance.dart';
import 'package:wincoremobile/screen/panel/notification/notifications.dart';
import 'package:wincoremobile/screen/panel/settings/about.dart';
import 'package:wincoremobile/screen/panel/settings/faq.dart';
import 'package:wincoremobile/screen/panel/settings/settings.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.username, required this.no_rek})
      : super(key: key);
  String username;
  String no_rek;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff120A7C),
        title: const Text(
          "Wincore Mobile",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Notifications()));
              },
              child: const Icon(Icons.notifications))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'WINCore Mobile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () => {
                Navigator.pop(context),
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('FAQ'),
              onTap: () => {
                // Navigator.pop(context),
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FAQ(),
                ))
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('About'),
              onTap: () => {
                // Navigator.pop(context),
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const About(),
                ))
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings())),
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFFF5F3F3),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                          ),
                          items: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/wbk-large.jpeg',
                                    width: double.infinity,
                                  ),
                                  // Image.asset(
                                  //   'assets/images/WINCore.jpeg',
                                  //   width: double.infinity,
                                  // ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  // Image.asset(
                                  //   'assets/images/wbk-large.jpeg',
                                  //   width: double.infinity,
                                  // ),
                                  Image.asset(
                                    'assets/images/WINCore.jpeg',
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 5),
                      child: Text(
                        "Hai, ${widget.username.toUpperCase()}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AccountBalance(
                                            nama: widget.username,
                                            no_rek: widget.no_rek,
                                          )));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.attach_money,
                                      size: 30,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Informasi Saldo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AccountActivities(
                                          no_rek: widget.no_rek)));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.list_alt_sharp,
                                      size: 30,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Mutasi Saldo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const TransferBalance()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.send_to_mobile_outlined,
                                      size: 30,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Kirim Saldo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => Settings()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const FaIcon(
                                        FontAwesomeIcons.shoppingBasket),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Pembayaran",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const FAQ()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.question_answer,
                                      size: 30,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Tanya WBK",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Card(
                              elevation: 0.2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Settings()));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.settings,
                                      size: 30,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Pengaturan",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black87),
                                    )
                                  ],
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
