import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'main.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  //const SplashScreenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: const MyHomePage(title: 'Flutter Google Sheet Demo'),
      backgroundColor: Colors.green,
      title: const Text('some text on splash screen'),
      image: Image.network('https://www.tavria-rus.ru/upload/iblock/f40/f402eb64176f6c876001f9a30f1d6d65.jpg'),
      loadingText: const Text('Loading'),
      photoSize: 110,
      loaderColor: Colors.red,
    );
  }
}
