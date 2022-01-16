import 'dart:convert';
import 'dart:developer';
import 'package:enter_engineering_test/ui/widgets/custom_textfield.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:flutter/material.dart';
import '../screens.dart';

class Registration extends StatefulWidget {
  static const routeName = 'registrationScreen';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _regKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Регистрация'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _regKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                //Confirm password
                CustomTextField(
                  hint: 'Подтвердите пароль',
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Заполните поле';
                    }
                    if (val != passwordController.text) return 'Пароли не совпадают';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
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
                    onPressed: () async {
                      Map<String, dynamic> regForm = {
                        'login': loginController.text,
                        'password': passwordController.text,
                        'passwordConfirm': confirmPasswordController.text,
                      };

                      if (_regKey.currentState!.validate()) {
                        preferences.setString('auth', jsonEncode(regForm));
                        userLibrary.add({
                          'login': loginController.text,
                          'password': passwordController.text,
                        });

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                              (Route<dynamic> route) => false,
                        );
                      }
                    },
                    // },
                    child: const Text('Зарегистрироваться'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
