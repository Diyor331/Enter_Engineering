import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:enter_engineering_test/models/user.dart';
import 'package:enter_engineering_test/ui/screens/screens.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
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
      await Hive.initFlutter();
      Hive.registerAdapter(LocalUsers());

      db = await Hive.openBox('db');

      if (db.get('auth') == null) {
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

      // Do not check http certificates
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          //Image
          Center(
            child: Image(
              image: AssetImage('images/logo1.jpeg'),
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
