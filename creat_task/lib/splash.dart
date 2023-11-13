import 'package:creat_task/upload.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const UploadView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/taskati.json"),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Taskati",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "It's Time To Get Orginezd",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      )),
    ));
  }
}
