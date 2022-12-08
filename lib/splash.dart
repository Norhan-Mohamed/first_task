import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? Key}) : super(key: Key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

    fadedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
    navigateToHome();
  }
  void dispose(){
    controller.dispose();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Transform(
                    transform: Matrix4.identity(),
                    alignment: Alignment.center,
                    child: Container(
                      child: FadeTransition(
                        opacity: fadedAnimation,
                        child: Image.network(
                            'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png'),
                      ),
                    )),
              );
            }));
  }
}
