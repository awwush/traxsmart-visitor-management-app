import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vms/ui/visitor_details.dart';

class PurposeOfVisit extends StatefulWidget {
  const PurposeOfVisit({Key? key}) : super(key: key);

  @override
  _PurposeOfVisitState createState() => _PurposeOfVisitState();
}

class _PurposeOfVisitState extends State<PurposeOfVisit> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSinglePurpose({String? title, IconData? icon}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const VisitorDetails()));
      },
      child: Card(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 2,
        // clipBehavior: Clip.hardEdge,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 25,
            ),
            Icon(
              icon,
              size: 35,
              color: const Color(0xffc5558e),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              title!,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 44, 24, 24),
        children: [
          Center(
            child: Text(
              "Purpose Of Visit",
              style: GoogleFonts.exo2(
                textStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          GridView.count(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 84),
            shrinkWrap: true,
            //physics: ClampingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildSinglePurpose(title: 'Interview', icon: FeatherIcons.users),
              _buildSinglePurpose(
                  title: 'Courier/Delivery', icon: FeatherIcons.truck),
              _buildSinglePurpose(title: 'Meeting', icon: FeatherIcons.coffee),
              _buildSinglePurpose(title: 'Others', icon: FeatherIcons.info),
            ],
          )
        ],
      ),
    );
  }
}
