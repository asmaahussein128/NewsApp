import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Screens/Views/Category_News.dart';
import 'Screens/Views/Home_Screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> with TickerProviderStateMixin {
  late final controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeInCirc);

  late String Category1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News",
        home: AnimatedSplashScreen(
            duration: 3000,
            backgroundColor: Colors.white,
            splashIconSize: 500,
            splash: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: Lottie.asset(
                        'assent/images/29447-global-mobile-news-network.json',
                        fit: BoxFit.cover),
                  ),
                  FadeTransition(
                    opacity: animation,
                    child: Text(
                      "News App",
                      style: TextStyle(fontSize: 28, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
            nextScreen: HomeScreen()),
        routes: {
          "HomeScreen": (context) => HomeScreen(),
          //"Category": (context) => Category(Category1)
        });
  }
}
