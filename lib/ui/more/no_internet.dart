import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Icon(
                    MdiIcons.wifiStrengthOffOutline,
                    size: 64,
                    color: customTheme.homemadePrimary,
                  )),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text("Whoops", style: TextStyle(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2),
                    textAlign: TextAlign.center,
              ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Column(
                  children: <Widget>[
                   Text(
                      "Slow or no internet connection",
                      style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                     textAlign: TextAlign.center,
                   ),

                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child:Text(
                        "Please check your internet settings",
                        style: TextStyle(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,

                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: customTheme.homemadePrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0))),
                    onPressed: () {},
                    child: Text("Try again",
                        style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onPrimary,
                        letterSpacing: 0.5)),),
              ),
            ],
          ),
        ));
  }
}
