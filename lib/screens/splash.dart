import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:to_do_list/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => Home(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: const TextStyle(fontSize: 30),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('TO DO'),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
