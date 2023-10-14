import 'package:flutter/material.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/login_screen.dart';
import 'package:riberio_dogstore/signup_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    primary1Color,
                    const Color(0xFF00D4FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.8],
                  tileMode: TileMode.clamp),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(children: [
                Image.asset("assets/images/logo_1.png"),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Wide Variety of Breeds",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Health and Care Standards",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Accessibility and Convenience",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.check, color: Colors.white, size: 20),
                          SizedBox(width: 10),
                          Text(
                            "Customer Support",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        backgroundColor: Colors.white,
                        fixedSize: Size(width, 45)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: primary1Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  "Don’t have an Account?",
                  style: TextStyle(
                      color: primary1Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ]),
            )));
  }
}
