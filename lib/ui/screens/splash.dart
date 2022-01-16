import 'dart:developer';
import 'package:enter_engineering_test/ui/screens/screens.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  static const routeName = 'splashScreen';

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    //Get auth data and navigate to Home or Login
    Future.delayed(const Duration(milliseconds: 4000), () async {
      preferences = await SharedPreferences.getInstance();
      if (preferences.getString('auth') == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Login(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          //Image
          Center(
            child: Image(
              image: AssetImage('images/logo.png'),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xffDBDAD8))),
          ),
        ],
      ),
    );
  }
}
