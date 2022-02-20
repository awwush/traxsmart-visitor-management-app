import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:vms/ui/dashboard.dart';
import 'package:vms/ui/login/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                      child: Row(
                        children: [
                          const Icon(
                            Icons.vpn_lock_rounded,
                            size: 17,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'en',
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
                    "Welcome to VSM",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(fontWeight: FontWeight.w600),
                        fontSize: 18.0,
                        color: const Color(0xffc5558e)),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
                  decoration: BoxDecoration(
                    color: const Color(0xffc5558e).withAlpha(100),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 25,
                          outlineBorderRadius: 15,
                          style: const TextStyle(fontSize: 17),
                          onChanged: (pin) {
                            if (kDebugMode) {
                              print("Changed: " + pin);
                            }
                          },
                          onCompleted: (pin) {
                            if (kDebugMode) {
                              print("Completed: " + pin);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Dashboard()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffc5558e),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: const Icon(
                            Icons.chevron_right_rounded,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ForgotPassword()));
                        },
                        child: Text(
                          'Forgot PIN?',
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Color(0xffc5558e), fontSize: 14.0)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
