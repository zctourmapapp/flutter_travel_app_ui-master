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

class _TravelApp extends StatefulWidget {
  const _TravelApp({
    Key? key,
    required this.navigator,
    required this.child,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  @override
  State<_TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<_TravelApp> {
  bool isOnboarding = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: isOnboarding
          ? _buildOnboarding(context)
          : Row(
              children: [
                SideBar(
                  width: width,
                  height: height,
                  navigator: widget.navigator,
                ),
                Expanded(child: widget.child)
              ],
            ),
    );
  }

  Container _buildOnboarding(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-3.jpg'),
          fit: BoxFit.cover,

        ),
      ),
      child:BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY:5,
        ) ,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ZamboTour',
              style: GoogleFonts.tradeWinds(
                    fontSize: 59,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isOnboarding = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Explore Now',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
