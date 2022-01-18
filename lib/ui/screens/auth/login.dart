import 'dart:convert';
import 'dart:developer';

import 'package:enter_engineering_test/ui/widgets/custom_textfield.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens.dart';

class Login extends StatefulWidget {
  static const routeName = 'loginScreen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/logo1.jpeg'),
                ),
                const SizedBox(height: 50),
                //Login
                CustomTextField(
                  hint: 'Логин',
                  controller: loginController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Заполните поле';
                    }
                  },
                ),
                const SizedBox(height: 10),
                //Password
                CustomTextField(
                  hint: 'Пароль',
                  controller: passwordController,
                  obscureText: true,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Заполните поле';
                    }
                  },
                ),
                const SizedBox(height: 10),
                //Login
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xffE42127)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_loginKey.currentState!.validate()) {
                        for(var el in userLibrary){
                          if(el['login'] == loginController.text && el['password'] == passwordController.text) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                                  (Route<dynamic> route) => false,
                            );
                          }
                        }

                        if (admin['login'] == loginController.text && admin['password'] == passwordController.text) {
                          db.put('auth', admin);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false,
                          );
                        }
                      }
                    },
                    child: const Text('Войти'),
                  ),
                ),
                const SizedBox(height: 10),
                //If user haven't account
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return Registration();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'У вас нет аккаунта? Зарегистрироваться',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
