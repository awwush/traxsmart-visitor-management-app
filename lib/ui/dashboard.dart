import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vms/ui/home.dart';
import 'package:vms/ui/reports.dart';
import 'package:vms/ui/track/track.dart';
import 'package:vms/ui/profile/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late BuildContext ctx;
  int currentIndex = 0;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Track',
      style: optionStyle,
    ),
    Text(
      'Report',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void onBackPress() {
    if (Navigator.of(ctx).canPop()) {
      Navigator.of(ctx).pop();
    }
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const Home();
      case 1:
        return const Reports();
      case 2:
        return const Track();
      case 3:
        return const ProfileScreen();
      default:
        return const Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          _getDrawerItemWidget(_selectedIndex),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    color: Color(0xffeeeeee),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: GNav(
                    rippleColor: const Color(0xffc5558e),
                    hoverColor: const Color(0xffc5558e),
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: const Color(0xffc5558e),
                    color: Colors.black87,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.room_outlined,
                        text: 'Report',
                      ),
                      GButton(
                        icon: Icons.add_chart,
                        text: 'Track',
                      ),
                      GButton(
                        icon: Icons.account_box_rounded,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                  // BottomAppBar(
                  //   shape: const AutomaticNotchedShape(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(30.0)))),
                  //   color: const Color(0xffc5558e),
                  //   elevation: 5.0,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 30.0, vertical: 4.0),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.max,
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: <Widget>[
                  //         IconButton(
                  //           alignment: Alignment.center,
                  //           onPressed: () {
                  //             const Home();
                  //             setState(() {
                  //               currentIndex = 0;
                  //             });
                  //           },
                  //           icon: Icon(
                  //             Icons.dashboard_rounded,
                  //             size: currentIndex == 0 ? 32 : 26,
                  //             color: currentIndex == 0
                  //                 ? const Color(0xffCC9D60)
                  //                 : Colors.white,
                  //           ),
                  //         ),
                  //         IconButton(
                  //           alignment: Alignment.center,
                  //           icon: Icon(
                  //             Icons.room_outlined,
                  //             size: currentIndex == 1 ? 32 : 26,
                  //             color: currentIndex == 1
                  //                 ? const Color(0xffCC9D60)
                  //                 : Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             const Track();
                  //             setState(() {
                  //               currentIndex = 1;
                  //             });
                  //           },
                  //         ),
                  //         IconButton(
                  //           alignment: Alignment.center,
                  //           icon: Icon(
                  //             Icons.add_chart,
                  //             size: currentIndex == 2 ? 32 : 26,
                  //             color: currentIndex == 2
                  //                 ? const Color(0xffCC9D60)
                  //                 : Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             const ProfileScreen();
                  //             setState(() {
                  //               currentIndex = 2;
                  //             });
                  //           },
                  //         ),
                  //         IconButton(
                  //           alignment: Alignment.center,
                  //           icon: Icon(
                  //             Icons.account_box_rounded,
                  //             size: currentIndex == 3 ? 32 : 26,
                  //             color: currentIndex == 3
                  //                 ? const Color(0xffCC9D60)
                  //                 : Colors.white,
                  //           ),
                  //           onPressed: () {
                  //             const ProfileScreen();
                  //             setState(() {
                  //               currentIndex = 3;
                  //             });
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ),
              )),
        ],
      ),
    ));
  }
}
