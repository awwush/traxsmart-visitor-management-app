import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int vpd = 10;
  int vpw = 23;
  int vpm = 68;

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 4;
    double screenEnd = MediaQuery.of(context).size.width / 4.2;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, screenEnd),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      'Reports',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total number of Workers:',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: cardWidth,
                          height: cardWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xffc5558e).withAlpha(40),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                vpd.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Divider(
                                thickness: 1.8,
                                color: const Color(0xffCC9D60),
                                indent: MediaQuery.of(context).size.width / 30,
                                endIndent:
                                    MediaQuery.of(context).size.width / 30,
                              ),
                              Text(
                                'Day',
                                style: GoogleFonts.lato(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: cardWidth,
                          height: cardWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xffc5558e).withAlpha(40),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                vpw.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Divider(
                                thickness: 1.8,
                                color: const Color(0xffCC9D60),
                                indent: MediaQuery.of(context).size.width / 30,
                                endIndent:
                                    MediaQuery.of(context).size.width / 30,
                              ),
                              Text(
                                'Week',
                                style: GoogleFonts.lato(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: cardWidth,
                          height: cardWidth,
                          decoration: BoxDecoration(
                            color: const Color(0xffc5558e).withAlpha(40),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                vpm.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Divider(
                                thickness: 1.8,
                                color: const Color(0xffCC9D60),
                                indent: MediaQuery.of(context).size.width / 30,
                                endIndent:
                                    MediaQuery.of(context).size.width / 30,
                              ),
                              Text(
                                'Month',
                                style: GoogleFonts.lato(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return _cardStyle();
                  },
                  padding: const EdgeInsets.all(2.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardStyle() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 4.0, left: 8.0, right: 16.0),
        decoration: const BoxDecoration(
          color: Color(0xfff0f0f0),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Image(
                height: 80,
                width: 80,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/man.png'),
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harshit',
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                      const Icon(
                        Icons.phone,
                        color: Color(0xffCC9D60),
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check out:',
                        style: GoogleFonts.lato(),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Text(
                        '12:00 PM',
                        style: GoogleFonts.lato(),
                      )),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Purpose',
                        style: GoogleFonts.lato(),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Text(
                        'Plumber',
                        style: GoogleFonts.lato(),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
