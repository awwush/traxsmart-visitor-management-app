import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    /// Brightness

    /// Primary Color
    primaryColor: Color(0xff069DEF),

    /// Scaffold and Background color
    backgroundColor: Color(0xff161616),
    canvasColor: Colors.transparent,

    /// AppBar Theme
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff161616)),

    /// Card Theme
    cardTheme: CardTheme(color: Color(0xff222327)),

    /// Colorscheme
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff069DEF),
      primaryVariant: Color(0xff069DEF),
      secondary: Color(0xff069DEF),
      secondaryVariant: Color(0xffffffff),
      background: Color(0xff161616),
      onPrimary: Colors.white,
      onBackground: Color(0xfff3f3f3),
      onSecondary: Colors.white,
      surface: Color(0xff585e63),
    ),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff069DEF)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70)),
    ),

    /// Divider Color
    dividerTheme: DividerThemeData(color: Color(0xff363636), thickness: 1),
    dividerColor: Color(0xff363636),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xff069DEF),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: Color(0xff069DEF),
        hoverColor: Color(0xff069DEF),
        foregroundColor: Colors.white),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
    BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff069DEF),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff069DEF), width: 2.0),
      ),
    ),

    ///Switch Theme
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xffabb3ea);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((state) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.pressed,
          MaterialState.hovered,
          MaterialState.focused,
          MaterialState.selected,
        };
        if (state.any(interactiveStates.contains)) {
          return Color(0xff3C4EC5);
        }
        return null;
      }),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xff069DEF),
      inactiveTrackColor: Color(0xff069DEF).withAlpha(100),
      trackShape: RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Color(0xff069DEF),
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),

    ///Other Color
    indicatorColor: Colors.white,
    disabledColor: Color(0xffa3a3a3),
    highlightColor: Colors.white.withAlpha(28),
    errorColor: Colors.orange,
    cardColor: Color(0xff282a2b),
    splashColor: Colors.white.withAlpha(56),
  );
    //primaryColor: Colors.black,
    // colorScheme: ColorScheme.dark(),
    // iconTheme: IconThemeData(color: AppTheme.customTheme.medicarePrimary, opacity: 0.8),


  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    //primaryColor: Colors.white,
    //colorScheme: ColorScheme.light(),
    //iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}
