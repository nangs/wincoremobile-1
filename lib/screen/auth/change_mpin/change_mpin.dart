import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_request.dart';
import 'package:wincoremobile/application/changeMPIN/cubit/change_mpin_cubit.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

// ignore: must_be_immutable
class ChangeMPIN extends StatefulWidget {
  ChangeMPIN({
    Key? key,
    required this.noRek,
    required this.username,
    required this.userid,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  @override
  State<ChangeMPIN> createState() => _ChangeMPINState();
}

class _ChangeMPINState extends State<ChangeMPIN> {
  final myPhoneNumberController = TextEditingController();
  final myRekeningController = TextEditingController();
  final myOldMPINController = TextEditingController();
  final myNewMPINController = TextEditingController();
  final myReMPINController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change MPIN"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: BlocProvider(
        create: (context) => ChangeMpinCubit(),
        child: BlocConsumer<ChangeMpinCubit, ChangeMpinState>(
          listener: (context, state) {
            if (state is MpinLoading) {
              print("Now is loading");
            } else if (state is MpinError) {
              print(state.errorMsg);
            } else if (state is ChangeMpinSuccessRestoreState) {
              print(state.chagesMpinResponse);
              if (state.chagesMpinResponse.status == "CHANGE_OK") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: const Text("Informasi"),
                      content: const Text("MPIN kamu berhasil diperbarui !"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Home(
                                        username: widget.username,
                                        no_rek: widget.noRek,
                                        userid: widget.userid)));
                          },
                        ),
                      ]),
                );
              }
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            style: const TextStyle(fontSize: 18.0),
                            obscureText: true,
                            controller: myOldMPINController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'M-PIN Lama',
                            ),
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
                          )),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            style: const TextStyle(fontSize: 18.0),
                            obscureText: true,
                            controller: myReMPINController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ketik Ulang Kata M-PIN Baru',
                            ),
                          )),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: 100,
                        margin: const EdgeInsets.only(top: 10),
                        child: (ChangeMpinState is MpinLoading)
                            ? _flatLoadingButton()
                            : _flatLoginButton(context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ElevatedButton _flatLoginButton(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          "Changes",
          style: GoogleFonts.nunito(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () async {
        final mpinRequest = MpinRequest(
          username: widget.userid,
          oldpin: myOldMPINController.text,
          newpin: myNewMPINController.text,
        );

        //print(widget.username);
        //print(widget.noRek);
        //print(widget.userid);
        //print(widget.key);

        context.read<ChangeMpinCubit>().changeMpin(mpinRequest);
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }

  ElevatedButton _flatLoadingButton() {
    return ElevatedButton(
      onPressed: null,
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2,
        ),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
