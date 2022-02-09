import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wincoremobile/helper/notification_content.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentdatetime = DateTime.now();
    var dateFormated =
        DateFormat('dd MMMM yyyy - hh:mm:ss').format(currentdatetime);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          NotificationContent(
            dateFormated: dateFormated,
            notificationTitle: "Withdrawal Success",
            notificationContent:
                "Penarikan tunai dari rekening 0100063001 sebesar Rp 150.000 telah berhasil.",
          ),
          NotificationContent(
            dateFormated: dateFormated,
            notificationTitle: "Transfer Balance Success",
            notificationContent:
                "Pemindahan dana ke Windy Sura Wijaya - 0100062901 sebesar Rp 125.000 telah berhasil.",
          ),
        ],
      ),
    );
  }
}
