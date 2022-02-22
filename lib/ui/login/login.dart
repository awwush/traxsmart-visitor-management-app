import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vms/theme/app_notifier.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:vms/ui/dashboard.dart';
import 'package:vms/ui/login/register.dart';
import 'package:vms/ui/select_language.dart';
import 'package:vms/extensions/string.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return SafeArea(
        child: Scaffold(
          body: ListView(
            children: [
              SizedBox(
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
                                        const SelectLanguageDialog()));
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
                        "Welcome to VSM".tr(),
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
                            "Number".tr(),
                            style: GoogleFonts.lato(
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.w600)),
                          )),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          cursorColor: Color(0xffc5558e),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          style: GoogleFonts.lato(
                              letterSpacing: 0.1,
                              color: const Color(0xffc5558e),
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            prefixText: "+91 ",
                            prefixStyle: GoogleFonts.lato(
                                letterSpacing: 0.1,
                                color: const Color(0xffc5558e),
                                fontWeight: FontWeight.w500),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: const Color(0xfff0f0f0),
                            prefixIcon: const Icon(
                              Icons.phone,
                              size: 22,
                              color: Color(0xffc5558e),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(0),
                          ),
                          keyboardType: TextInputType.number,
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
                            "Password".tr(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
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
                                      const RegisterScreen()));
                        },
                        child: Text(
                          "Register".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  Container(
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
                                    const Dashboard()));
                      },
                      child: const Icon(
                        Icons.chevron_right_rounded,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ForgotPassword()));
                },
                child: Center(
                  child: Text(
                    'Forgot PIN?'.tr(),
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: customTheme.homemadePrimary,
                      fontSize: 14.0,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
