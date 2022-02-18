import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vms/ui/qr_scan.dart';

class VisitorDetails extends StatefulWidget {
  const VisitorDetails({Key? key}) : super(key: key);

  @override
  _VisitorDetailsState createState() => _VisitorDetailsState();
}

class _VisitorDetailsState extends State<VisitorDetails> {
  late ThemeData theme;
  late CustomTheme customTheme;
  String dropdownvalue = 'Collectrate Office';

  var items = ['Collectrate Office', 'Post Office', 'RTO Office'];

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildForm({String? text}) {
    return TextFormField(
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
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(color: customTheme.homemadePrimary, width: 2),
        ),
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
      ),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 44, 24, 24),
        children: [
          Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground.withAlpha(18),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                child: const Icon(Icons.add_a_photo_outlined),
              ),
              Container(
                height: 32.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xffc5558e),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                ),
                child: const Center(
                    child: Text(
                  'Take Photo',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _buildForm(text: 'Name'),
          const SizedBox(
            height: 20,
          ),
          _buildForm(text: 'Phone Number'),
          const SizedBox(
            height: 20,
          ),
          _buildForm(text: 'Work Type'),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 7, 15, 7),
            decoration: BoxDecoration(
              color: theme.colorScheme.onBackground.withAlpha(18),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(FeatherIcons.arrowDownCircle),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: theme.colorScheme.onBackground.withAlpha(200),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ListView(shrinkWrap: true, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const QRScanner()));
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
                        'Allow',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
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
}
