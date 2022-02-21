import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/ui/profile/profile_screen.dart';

import '../data/card_style/card_style.dart';
import 'purpose_of_visit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                                  MaterialPageRoute(
                                      builder: (_) =>
                                      const PurposeOfVisit());
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
                                                      const ProfileScreen()),
                                            );
                                            break;
                                          case 1:
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfileScreen()),
                                            );
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
