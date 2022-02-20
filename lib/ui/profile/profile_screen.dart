import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    double screenEnd = MediaQuery.of(context).size.width / 4.2;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, screenEnd),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Color(0xffe6e6e6),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                    image: AssetImage('assets/images/man.png'),
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harshit',
                      style: GoogleFonts.lato(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      'dummyemail12@gmail.com',
                      style: GoogleFonts.lato(),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        //color: const Color(0xffCC9D60).withAlpha(40),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        border: Border.all(
                            color: const Color(0xffCC9D60), width: 1.0),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          //borderColor: const Color(0xffCC9D60),
                          //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Text(
                            "Edit profile",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Color(0xffCC9D60),
                                    fontWeight: FontWeight.w600)),
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                  color: Color(0xffe6e6e6),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 8.0),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      "Personal Information",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        letterSpacing: 0,
                      )),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      "Country",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(letterSpacing: 0)),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                  const ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(
                      "Favorite Items",
                      //letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.black87,
                    ),
                  ),
                  SwitchListTile(
                    dense: true,
                    inactiveTrackColor: const Color(0xffCC9D60).withAlpha(100),
                    activeTrackColor: const Color(0xffCC9D60).withAlpha(150),
                    activeColor: const Color(0xffCC9D60),
                    title: const Text(
                      "Notifications",
                    ),
                    onChanged: (value) {
                      setState(() {
                        //profileController.notification = value;
                      });
                    },
                    value: true,
                    //value: profileController.notification,
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        color: const Color(0xffc5558e).withAlpha(60),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        //profileController.logout();
                      },
                      child: Text(
                        "LOGOUT",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                          color: Color(0xffc5558e),
                          letterSpacing: 0.5,
                        )),
                      ),
                      //backgroundColor: const Color(0xffc5558e).withAlpha(40),
                    ),
                  ))
                ],
              )),
          const SizedBox(height: 16.0),
          const Divider(
            thickness: 0.8,
          ),
          const SizedBox(height: 8.0),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Text(
              "© 2021 FlutKit. Design by Coderthemes",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                //textAlign: TextAlign.center,
                letterSpacing: 0,
              )),
            ),
          )
        ],
      ),
    );
  }
}
