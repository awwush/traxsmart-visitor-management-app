import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/ui/profile/profile_screen.dart';
import '../data/card_style/card_style.dart';
import 'package:vms/ui/purpose_of_visit.dart';
import 'package:vms/ui/register_details.dart';
import '../theme/app_theme.dart';
import 'more/about.dart';
import 'more/no_internet.dart';
import 'more/success.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _UploadDoneDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenEnd = MediaQuery.of(context).size.width / 4.2;
    double settingButtonLocation = MediaQuery.of(context).size.width / 17;

    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  ClipPath(
                    child: Container(
                      color: const Color(0xffc5558e).withAlpha(60),
                    ),
                    clipper: WaveClipperTwo(flip: true),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffc5558e).withAlpha(150),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: settingButtonLocation,
                            right: settingButtonLocation,
                            child: Icon(Icons.settings),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: const ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    child: Image(
                                      height: 90,
                                      width: 90,
                                      image: AssetImage(
                                        'assets/images/man.png',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ayush',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0,
                                      )),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Watchman',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      )),
                                    ),
                                    Text(
                                      'Gate: 1',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.fromLTRB(24, 24, 24, screenEnd),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffCC9D60).withAlpha(150),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: Text(
                                  'Scan QR',
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const PurposeOfVisit()));
                                },
                              ),
                              const SizedBox(width: 20.0),
                              const Icon(Icons.qr_code_scanner_rounded),
                            ],
                          )),
                        )),
                    const SizedBox(height: 20.0),
                    Expanded(
                        flex: 7,
                        child: Container(
                          child: GridView.count(
                              primary: false,
                              crossAxisCount: 2,
                              crossAxisSpacing: 18.0,
                              mainAxisSpacing: 18.0,
                              children:
                                  List.generate(homeScreenCard.length, (index) {
                                return Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        switch (index) {
                                          case 0:
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterDetailsScreen()),
                                            );
                                            break;
                                          case 1:
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           UploadProgress()),
                                            // );
                                            showMyDialog(context);
                                            break;
                                          default:
                                          //return HomeRoute();
                                        }
                                      },
                                      child: CardStyle(
                                          homeScreenCard:
                                              homeScreenCard[index])),
                                );
                              })),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

List<HomeScreenCard> homeScreenCard = <HomeScreenCard>[
  const HomeScreenCard(
      title: 'Register',
      image: Image(image: AssetImage('assets/images/man.png'))),
  const HomeScreenCard(
      title: 'Help', image: Image(image: AssetImage('assets/images/man.png'))),
];

class CardStyle extends StatelessWidget {
  const CardStyle({Key? key, required this.homeScreenCard}) : super(key: key);
  final HomeScreenCard homeScreenCard;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          //side: BorderSide(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 8,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff6d65df).withAlpha(40),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 24.0),
                Expanded(
                  flex: 5,
                  child: homeScreenCard.image,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homeScreenCard.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UploadDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                  child: Icon(
                Icons.cloud_upload_outlined,
                size: 40,
                color: AppTheme.customTheme.homemadePrimary,
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: Text("Success!",
                      style: TextStyle(fontWeight: FontWeight.w700))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: Text("Your file upload successful",
                      style: TextStyle(fontWeight: FontWeight.w600))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Center(
                  child: Text("Now you can check your file",
                      style: TextStyle(fontWeight: FontWeight.w600))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppTheme.customTheme.homemadePrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Go to Folder",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onPrimary)))),
            )
          ],
        ),
      ),
    );
  }
}
