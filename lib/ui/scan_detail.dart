import 'package:flutter/material.dart';
import 'package:vms/theme/app_theme.dart';

class ScanDetail extends StatefulWidget {
  const ScanDetail({Key? key}) : super(key: key);

  @override
  _ScanDetailState createState() => _ScanDetailState();
}

class _ScanDetailState extends State<ScanDetail> {
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
    return SafeArea(
      child: Scaffold(),
    );
  }
}
