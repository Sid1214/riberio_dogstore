import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/home_screen.dart';
import 'package:riberio_dogstore/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // void callApi() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();

  //   Future.delayed(const Duration(seconds: 1)).whenComplete(() {
  //     ref.watch(logged.notifier).state = prefs.getBool('logged') ?? false;
  //   });
  // }

  // @override
  // void initState() {
  //   callApi();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
              onPressed: () {
                login(username: _username.text, password: _password.text);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: secondaryColor,
                  fixedSize: Size(width, 45)),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/logo.png", width: 350, height: 250),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: primary1Color,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Username",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(
                      width: width,
                      child: TextField(
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _username,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(
                      width: width,
                      child: TextField(
                        obscureText: true,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0.4,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: _password,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 160),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Don’t have an Account?',
                    style: TextStyle(
                      color: primary1Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  login({required String username, required String password}) async {
    log('come');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String tempusername = prefs.getString('username')!;
    String temppassword = prefs.getString('password')!;
    log("${temppassword.toString()}+${tempusername.toString()}");
    if (username == tempusername && password == temppassword) {
      // ignore: use_build_context_synchronously
      prefs.setBool('logged', true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else {
      Fluttertoast.showToast(
          msg: "User Does Not Exist.Please Register",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
