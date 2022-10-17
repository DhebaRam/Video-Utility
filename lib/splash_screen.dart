import 'package:flutter/material.dart';
import 'package:video_utility/utils/app_images.dart';
import 'package:video_utility/utils/dimens.dart';

import 'home/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    getScreenSize(context);
    return Scaffold(
        body: Center(
      child: Image.asset(
        AppImages.splashscreen,
        fit: BoxFit.fill,
        height: screenSize!.height,
        width: screenSize!.width,
      ),
    ));
  }
}
