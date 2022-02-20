import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    double screenEnd = MediaQuery.of(context).size.width / 4.2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, screenEnd),
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                style: GoogleFonts.lato(),
                cursorColor: const Color(0xffCC9D60),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Color(0xffc5558e))),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide.none),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: const Color(0xfff0f0f0),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Color(0xffc5558e),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.only(right: 16),
                ),
                textCapitalization: TextCapitalization.sentences,
              )),
              const SizedBox(width: 16.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                    padding: const EdgeInsets.all(13.0),
                    decoration: BoxDecoration(
                      color: const Color(0xffCC9D60).withAlpha(28),
                      border: Border.all(
                          color: const Color(0xffCC9D60).withAlpha(120)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: const Icon(
                      Icons.tune,
                      color: Color(0xffCC9D60),
                      size: 18,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return const TrackCard();
                },
                padding: const EdgeInsets.all(2.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TrackCard extends StatefulWidget {
  const TrackCard({Key? key}) : super(key: key);

  @override
  _TrackCardState createState() => _TrackCardState();
}

class _TrackCardState extends State<TrackCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
            right: 14.0, top: 4.0, bottom: 4.0, left: 8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          color: Color(0xffeeeeee),
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
                        color: Color(0xffc5558e),
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.phone_outlined,
                        color: Color(0xffCC9D60),
                        size: 16,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: Text(
                        '+91 94352 XXXXX',
                      )),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffCC9D60),
                        size: 16,
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                          child: Text(
                        'Visitor',
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
