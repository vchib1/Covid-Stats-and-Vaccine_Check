import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:covid19app/constants/constants.dart';
import 'package:covid19app/dataresults.dart';
import 'package:covid19app/statspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid-19 App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SpaceGrotesk',
        useMaterial3: true,
      ),
      //initialRoute: 'stats',
      routes: {
        'pinPage': (context) => const HomePage(),
        'results': (context) =>  const DataResults(),
        'stats': (context) =>  const StatsPage(),
      },
      home: AnimatedSplashScreen(
        splashIconSize: 600,
        splash: Scaffold(
          backgroundColor: Constants.thirdColor,
          body: Column(
            children: [
              SvgPicture.asset('assets/stats.svg',fit: BoxFit.contain,),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: LinearProgressIndicator(
                  color: Constants.firstColor,
                ),
              ),
            ],
          ),
        ),
        nextScreen: const StatsPage(),
        duration: 5000,
        backgroundColor: Constants.thirdColor,
      ),
    );
  }
}

