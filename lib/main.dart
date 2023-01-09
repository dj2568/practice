import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:practice/09_01_2023_UI/LoginScreen.dart';
import 'package:practice/09_01_2023_UI/SplashScreen.dart';
import 'package:practice/CustomSwitch/custom_switch.dart';
import 'package:practice/NightMode/DarkThemePreference.dart';
import 'package:practice/NightMode/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _primaryColor = HexColor('#FF7B54');
    Color _accentColor = HexColor('#FFB26B');
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: _accentColor),
      ),
      home: const SplashScreen(),
    );
    final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkTheme : lightTheme;
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: myTheme,
          home: const CustomSwitch(),
        );
      },
    );
  }
}
