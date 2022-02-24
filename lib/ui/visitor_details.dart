import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vms/ui/qr_scan.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class VisitorDetails extends StatefulWidget {
  const VisitorDetails({Key? key}) : super(key: key);

  @override
  _VisitorDetailsState createState() => _VisitorDetailsState();
}

class _VisitorDetailsState extends State<VisitorDetails> {
  late ThemeData theme;
  late CustomTheme customTheme;
  final _formKey = GlobalKey<FormState>();
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
      validator: Validators.compose([
        Validators.required('Work Type is required'),
        Validators.patternRegExp(
            RegExp(r"^[A-Za-z ]+$"), 'Only alphabets are allowed')
      ]),
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
    return Form(
      key: _formKey,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.fromLTRB(24, 44, 24, 0),
          children: [
            const Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage("assets/images/visitor.png"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: Validators.compose([
                Validators.required('Name is required'),
                Validators.patternRegExp(
                    RegExp(r"^[A-Za-z ]+$"), 'Only alphabets are allowed')
              ]),
              cursorColor: customTheme.homemadePrimary,
              decoration: InputDecoration(
                hintText: 'Name',
                labelText: 'Name',
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
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: customTheme.homemadePrimary,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(10),
              ],
              validator: Validators.compose([
                Validators.required('Number is required'),
                Validators.minLength(10, 'Number should be of 10 digits'),
              ]),
              decoration: InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
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
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(25, 15, 15, 25),
              ),
              keyboardType: TextInputType.number,
              textCapitalization: TextCapitalization.sentences,
            ),
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
                  border: Border.all(color: Colors.grey.shade700)),
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
              height: 20,
            ),
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
                  child: const Icon(FeatherIcons.file),
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
                    'Upload Doc',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(24, 10, 24, 14),
          child: GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Login Successful')),
                );

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const QRScanner()));
              }
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
        ),
      ),
    );
  }
}
