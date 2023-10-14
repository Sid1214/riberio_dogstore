import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riberio_dogstore/Theme/color.dart';
import 'package:riberio_dogstore/intro_screen.dart';
import 'package:riberio_dogstore/userdetail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  _launchURL() async {
    Uri url = Uri.parse('https://pub.dev/policy');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1() async {
    Uri url = Uri.parse('https://dart.dev/');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// https://dart.dev/
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setBool('logged', false);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()));
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                backgroundColor: secondaryColor,
                fixedSize: Size(width, 45)),
            child: const Text(
              "Logout",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            )),
      ),
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
          "Settings",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: primary1Color,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserDetailScreen()));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/userdetails.svg"),
                        // Icon(
                        //   Icons.,
                        //   color: primary1Color,
                        //   size: 30,
                        // ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'User Details',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: primary1Color),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primary1Color,
                        )
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: _launchURL,
                    child: Row(
                      children: [
                        Icon(
                          Icons.policy_outlined,
                          color: primary1Color,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: primary1Color),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primary1Color,
                        )
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: _launchURL1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: primary1Color,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'About us',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: primary1Color),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primary1Color,
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
