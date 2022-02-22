import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vms/theme/app_notifier.dart';
import 'package:vms/ui/login/login.dart';
import 'package:vms/ui/select_language.dart';
import 'package:vms/extensions/string.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 3 / 10,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffc5558e).withAlpha(100),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(96))),
                    ),
                    Positioned(
                        top: 20,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SelectLanguageDialog()));
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.vpn_lock_rounded,
                                size: 17,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                'en'.tr(),
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                  fontSize: 14.0,
                                )),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      bottom: 20,
                      right: 40,
                      child: Text(
                        "Create new Password".tr(),
                        style: GoogleFonts.lato(
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.w600),
                            fontSize: 18.0,
                            color: const Color(0xffc5558e)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "New Password".tr(),
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w600)),
                          )),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: Color(0xffc5558e),
                          style: GoogleFonts.lato(
                              letterSpacing: 0.1,
                              color: const Color(0xffc5558e),
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xfff0f0f0),
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 22,
                              color: Color(0xffc5558e),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(0),
                          ),
                          //keyboardType: TextInputType.,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Confirm Password".tr(),
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w600)),
                          )),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: Color(0xffc5558e),
                          style: GoogleFonts.lato(
                              letterSpacing: 0.1,
                              color: const Color(0xffc5558e),
                              fontWeight: FontWeight.w500),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xfff0f0f0),
                            prefixIcon: Icon(
                              Icons.password,
                              size: 22,
                              color: Color(0xffc5558e),
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(0),
                          ),
                          //keyboardType: TextInputType.,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffc5558e),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  //const PurposeOfVisit()));
                                  const LoginScreen()));
                    },
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      );
    });
  }
}
