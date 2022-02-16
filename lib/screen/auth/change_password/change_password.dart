import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_request.dart';
import 'package:wincoremobile/application/changePass/cubit/change_pass_cubit.dart';
import 'package:wincoremobile/screen/panel/home/home.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  ChangePassword({
    Key? key,
    required this.noRek,
    required this.username,
    required this.userid,
  }) : super(key: key);

  String noRek;
  String username;
  String userid;
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isObscure = true;

  final myPhoneNumberController = TextEditingController();
  final myAccountNumberController = TextEditingController();
  final myOldPasswordController = TextEditingController();
  final myNewPasswordController = TextEditingController();
  final myRePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
        backgroundColor: const Color(0xff120A7C),
      ),
      body: BlocProvider(
        create: (context) => ChangePassCubit(),
        child: BlocConsumer<ChangePassCubit, ChangePassState>(
          listener: (context, state) {
            if (state is PassLoading) {
              print("Now is loading");
            } else if (state is PassError) {
              print(state.errorMsg);
            } else if (state is ChangePassSuccessRestoreState) {
              print(state.chagesPassResponse);
              if (state.chagesPassResponse.status == "CHANGE_OK") {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      title: const Text("Informasi"),
                      content:
                          const Text("Password kamu berhasil diperbarui !"),
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
                            controller: myOldPasswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kata Sandi Lama',
                            ),
                            //onChanged: (text) {
                            //nOldPassword = text;
                            //},
                          )),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            style: const TextStyle(fontSize: 18.0),
                            obscureText: true,
                            controller: myNewPasswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Kata Sandi Baru',
                            ),
                            //onChanged: (text) {
                            //nNewPassword = text;
                            //},
                          )),
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            style: const TextStyle(fontSize: 18.0),
                            obscureText: true,
                            controller: myRePasswordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Ketik Ulang Kata Sandi Baru',
                            ),
                            //onChanged: (text) {
                            //nRePassword = text;
                            //},
                          )),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: 100,
                        margin: const EdgeInsets.only(top: 10),
                        child: (ChangePassState is PassLoading)
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
        final passRequest = PassRequest(
          username: widget.userid,
          oldpass: myOldPasswordController.text,
          newpass: myNewPasswordController.text,
        );

        //print(widget.username);
        //print(widget.noRek);
        //print(widget.userid);
        //print(widget.key);

        context.read<ChangePassCubit>().changePass(passRequest);
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
