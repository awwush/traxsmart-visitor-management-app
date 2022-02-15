import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vms/extensions/string.dart';
import 'package:vms/localizations/language.dart';
import 'package:vms/theme/app_notifier.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatefulWidget {
  const SelectLanguageDialog({Key? key}) : super(key: key);

  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;
  Language lang = Language.currentLanguage;

  Language currentLanguage = Language.currentLanguage;
  List<Language> languages = Language.languages;

  @override
  initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Future<void> handleRadioValueChange(Language language) async {
    setState(() {
      Provider.of<AppNotifier>(context, listen: false).changeLanguage(language);
    });
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    // return Consumer<AppNotifier>(
    //   builder: (BuildContext context, AppNotifier value, Widget? child) {
    //     theme = AppTheme.theme;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 44, 24, 24),
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground.withAlpha(13),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: theme.colorScheme.onBackground.withAlpha(160),
                    size: 24,
                  ),
                  padding: new EdgeInsets.all(5.0),
                ),
              ),
              const SizedBox(width: 14.0),
              Text(
                'Change Language'.tr(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            flex: 9,
            child: Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min, children: _buildOptions()),
            ),
          ),
          SizedBox(
            height: 335,
          ),
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView(shrinkWrap: true, children: [
                  GestureDetector(
                    onTap: () {
                      handleRadioValueChange(currentLanguage);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: customTheme.medicarePrimary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: const Center(
                          child: Text(
                        'Apply',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0),
                      )),
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }

  _buildOptions() {
    List<Widget> list = [];

    for (Language language in Language.languages) {
      list.add(
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 6,
          child: Row(
            children: <Widget>[
              Radio<Language>(
                onChanged: (value) {
                  setState(() {
                    currentLanguage = language; //imp
                  });
                },
                groupValue: currentLanguage,
                value: language,
                activeColor: AppTheme.customTheme.medicarePrimary,
              ),
              Text(
                language.languageName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return list;
  }
}
