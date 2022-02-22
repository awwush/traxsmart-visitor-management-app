import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vms/theme/app_notifier.dart';
import 'package:vms/ui/login/login.dart';
import 'package:vms/ui/select_language.dart';
import 'package:vms/extensions/string.dart';
import 'package:vms/theme/app_theme.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildForm({String? text}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextFormField(
        cursorColor: customTheme.homemadePrimary,
        decoration: InputDecoration(
          hintText: text!,
          labelText: text,
          hintStyle: TextStyle(
            color: theme.colorScheme.onBackground.withAlpha(200),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide:
                BorderSide(color: customTheme.homemadePrimary, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
        ),
        textCapitalization: TextCapitalization.sentences,
      ),
    );
  }

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
                        "Create Profile".tr(),
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
              _buildForm(text: 'Name'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextFormField(
                  readOnly: true,
                  cursorColor: customTheme.homemadePrimary,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(
                          color: customTheme.homemadePrimary, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextFormField(
                  readOnly: true,
                  cursorColor: customTheme.homemadePrimary,
                  decoration: InputDecoration(
                    hintText: 'Employee ID',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(
                          color: customTheme.homemadePrimary, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: TextFormField(
                  cursorColor: customTheme.homemadePrimary,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Create Password',
                    labelText: 'Create Password',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      borderSide: BorderSide(
                          color: customTheme.homemadePrimary, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xffc5558e),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: const Center(
                    child: Text(
                  'LogIn',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                )),
              ),
            ),
          ),
        ),
      );
    });
  }
}
