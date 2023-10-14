import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riberio_dogstore/home_screen.dart';
import 'package:riberio_dogstore/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

StateProvider loggedProvider = StateProvider((ref) => false);

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Overpass",
      ),
      title: 'Riberio Dog Store',
      home:
          //  checklogin ? const HomeScreen() :
          const Main(),
    );
  }
}

class Main extends ConsumerStatefulWidget {
  const Main({super.key});

  @override
  ConsumerState<Main> createState() => _MainState();
}

class _MainState extends ConsumerState<Main> {
  void callApi() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 5)).whenComplete(() {
      ref.watch(loggedProvider.notifier).state =
          prefs.getBool('logged') ?? false;
    });
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final checklogin = ref.watch(loggedProvider);
    return checklogin ? const HomeScreen() : const SplashScreen();
  }
}
