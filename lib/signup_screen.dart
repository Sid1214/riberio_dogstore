import 'package:flutter/material.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone_no = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Image.asset(
            "assets/images/logo.png",
            height: 120,
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
              onPressed: () {
                register(
                    name: _name.text,
                    username: _username.text,
                    password: _password.text,
                    phoneno: _phone_no.text,
                    address: _address.text);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: secondaryColor,
                  fixedSize: Size(width, 45)),
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset("assets/images/logo.png", width: 350, height: 250),
                Center(
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      color: primary1Color,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
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
                        "Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
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
                          controller: _name,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
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
                        " Create Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
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
                          controller: _password,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
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
                          controller: _phone_no,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
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
                          controller: _address,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  register(
      {required String name,
      required String username,
      required String password,
      required String phoneno,
      required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('mobile_number', phoneno);
    prefs.setString('address', address);
    prefs.setBool('logged', true);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
