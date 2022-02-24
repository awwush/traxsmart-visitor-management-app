import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:provider/provider.dart';
import 'package:vms/extensions/string.dart';
import 'package:vms/theme/app_notifier.dart';
import 'package:vms/ui/login/new_password.dart';
import 'package:vms/ui/select_language.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final List<bool> _dataExpansionPanel = [true, false];
  int _counter = 30;
  Timer? _timer;
  String otp = "";

  void _startTimer() {
    _counter = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          if (kDebugMode) {
            print('$_counter');
          }
          _counter--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return SafeArea(
          child: Form(
        key: _formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 2.5 / 10,
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
                          "Forgot Password".tr(),
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
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
                    child: ExpansionPanelList(
                      expandedHeaderPadding: const EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _dataExpansionPanel[index] = !isExpanded;
                        });
                      },
                      animationDuration: const Duration(milliseconds: 500),
                      children: <ExpansionPanel>[
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    "Number".tr(),
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: isExpanded
                                                ? FontWeight.w600
                                                : FontWeight.w400)),
                                  ));
                            },
                            body: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    validator: Validators.compose([
                                      Validators.required('Number is required'),
                                      Validators.minLength(
                                          10, 'Number should be of 10 digits'),
                                    ]),
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
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          child: TextButton(
                                              onPressed: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  _startTimer();
                                                }
                                              },
                                              child: Text(
                                                "Send OTP".tr(),
                                                style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(
                                                        0xffc5558e)),
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            isExpanded: _dataExpansionPanel[0]),
                        ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    "OTP".tr(),
                                    style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontWeight: isExpanded
                                                ? FontWeight.w600
                                                : FontWeight.w500)),
                                  ));
                            },
                            body: Container(
                                padding:
                                    const EdgeInsets.only(bottom: 16, top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: OTPTextField(
                                        length: 6,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        textFieldAlignment:
                                            MainAxisAlignment.spaceAround,
                                        fieldWidth: 25,
                                        outlineBorderRadius: 15,
                                        style: const TextStyle(fontSize: 17),
                                        onChanged: (pin) {
                                          otp = pin;
                                          if (kDebugMode) {
                                            print("Changed: ".tr() + pin);
                                          }
                                        },
                                        onCompleted: (pin) {
                                          otp = pin;
                                          if (kDebugMode) {
                                            print("Changed: ".tr() + pin);
                                          }
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            (_counter == 0)
                                                ? Text(
                                                    "Resend",
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                  )
                                                : Text(
                                                    "Resend in ".tr() +
                                                        '$_counter',
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                letterSpacing:
                                                                    0.2)),
                                                  ),
                                          ],
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                          child: TextButton(
                                              onPressed: () {
                                                if (otp.length == 6) {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (_) =>
                                                              PasswordScreen()));
                                                }
                                              },
                                              child: Text(
                                                "Verify".tr(),
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            Color(0xffc5558e))),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            isExpanded: _dataExpansionPanel[1])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}
