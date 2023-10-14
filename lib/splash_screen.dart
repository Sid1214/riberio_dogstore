import 'package:flutter/material.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/intro_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {
          isLoaded = true;
        }));
  }
  // @override
  // void initState() {
  //   _navigatetointro();
  //   super.initState();
  // }

  // _navigatetointro() async {
  //   await Future.delayed(const Duration(seconds: 5), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const IntroScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      duration: (const Duration(seconds: 5)),
      navigateWhere: isLoaded,
      navigateRoute: const IntroScreen(),
      backgroundColor: Colors.white,
      linearGradient: LinearGradient(
          colors: [
            primary1Color,
            const Color(0xFF00D4FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.1, 0.8],
          tileMode: TileMode.clamp),
      imageSrc: "assets/images/logo_1.png",
      logoSize: 380,
      displayLoading: false,
    );
    // Scaffold(
    //   body: Container(
    //     decoration: const BoxDecoration(
    //         gradient: LinearGradient(colors: [
    //       Color.fromARGB(255, 36, 80, 145),
    //       Color.fromARGB(255, 85, 193, 209),
    //     ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Image.asset(
    //             'assets/images/logo.png',
    //             width: 350,
    //           ),
    //           // const SizedBox(height: 40),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
