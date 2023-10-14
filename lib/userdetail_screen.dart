import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailScreen extends ConsumerStatefulWidget {
  const UserDetailScreen({super.key});

  @override
  ConsumerState<UserDetailScreen> createState() => _UserDetailScreenState();
}

StateProvider userdataProvider = StateProvider((ref) => true);
String username = "";
String name = "";
String mobilenumber = "";
String address = "";
String password = "";

class _UserDetailScreenState extends ConsumerState<UserDetailScreen> {
  Future callApi() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username').toString();
    password = prefs.getString('password').toString();
    name = prefs.getString('name').toString();
    mobilenumber = prefs.getString('mobile_number').toString();
    address = prefs.getString('address').toString();
    ref.watch(userdataProvider.notifier).state = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final loader = ref.watch(userdataProvider);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: primary1Color,
              )),
          backgroundColor: Colors.white,
          title: Text(
            "User Details",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: primary1Color,
            ),
          ),
          centerTitle: true,
        ),
        body: loader
            ? const CircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Username",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          username,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          password,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Mobile Number",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          mobilenumber,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Address",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          address,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
