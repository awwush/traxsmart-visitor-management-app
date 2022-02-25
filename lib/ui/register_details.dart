import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/theme/app_theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:vms/ui/qr_scan.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:image_picker/image_picker.dart';

class RegisterDetailsScreen extends StatefulWidget {
  const RegisterDetailsScreen({Key? key}) : super(key: key);

  @override
  _RegisterDetailsScreenState createState() => _RegisterDetailsScreenState();
}

class _RegisterDetailsScreenState extends State<RegisterDetailsScreen>
    with TickerProviderStateMixin {
  File? _image;
  late ThemeData theme;
  late CustomTheme customTheme;
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Work Type';

  var items = ['Work Type', 'Post Office', 'RTO Office'];

  //Take Photo from Camera
  final _picker = ImagePicker();
  Future takePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    final File? file = File(image!.path);

    setState(() {
      _image = file;
    });
  }

  @override
  void initState() {
    super.initState();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildForm({String? text}) {
    return TextFormField(
      validator: Validators.compose([
        Validators.required('Name is required'),
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
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                // _imgFromCamera();
                takePhoto();
              },
              child: Center(
                child: _image == null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                                width: 4.0, color: customTheme.homemadePrimary),
                          ),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                            color: customTheme.homemadePrimary,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        child: Image(
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          image: FileImage(File(_image!.path)),
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildForm(text: 'Name'),
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
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 5, 15, 5),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onBackground.withAlpha(18),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade700)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: const Text("Work Type"),
                  disabledHint: const Text("Work Type"),
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
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 14),
          child: GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registered Successfully')),
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
                'Register',
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
