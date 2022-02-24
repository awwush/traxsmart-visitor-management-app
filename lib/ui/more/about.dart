import 'package:vms/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'generator.dart';


class AboutAppScreen extends StatefulWidget {
  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: Colors.black,
            ),
          ),
          title: Text("About App", style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
          ),),
        ),
        backgroundColor: theme.backgroundColor,
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(top: 0, left: 24, right: 24),
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/traxsmart.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("VSM",
                              style: TextStyle(fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onBackground),
                              ),
                          Container(
                            child: Text("TraxSmart Company",
                                style: TextStyle( fontWeight: FontWeight.w500,
                                    color: theme.colorScheme.onBackground),
                               ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: customTheme.homemadePrimary,
                          ),
                          child: Text("v 7.0.0",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: theme.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3
                              ),
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Text(Generator.getDummyText(32, withTab: true),
                    style: TextStyle(fontWeight: FontWeight.w500, color: theme.colorScheme.onBackground),
                    ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(Generator.getDummyText(48, withTab: true),
    style: TextStyle(fontWeight: FontWeight.w500, color: theme.colorScheme.onBackground),
              ),
              ),
            ],
          ),
        ));
  }
}
