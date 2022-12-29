import 'dart:ui';
import 'package:flutter_travel_app_ui/screens/signin_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_app_ui/screens/restaurant_screen.dart';
import 'package:flutter_travel_app_ui/widgets/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/activities_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); 
  runApp(const TravelApp()); 
  FlutterNativeSplash.remove();
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zamboanga Tourism App',
      initialRoute: '/',
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelsScreen.routeName: (context) => const HotelsScreen(),
      },
      builder: (context, child) {
        return _TravelApp(
          navigator: (child!.key as GlobalKey<NavigatorState>),
          child: child,
        );
      },
      getPages: [
        GetPage(name: '/', page: () => const SigninScreen()),
        GetPage(name: '/activities', page: () => const ActivitiesScreen()),
        GetPage(name: '/hotels', page: () => const HotelsScreen()),
      ],
    );
  }
}
