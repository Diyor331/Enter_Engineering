import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';

//Если была бы API то это класс можно было бы использовать в блоке
class Locale {
  dynamic userLogin;
  dynamic userPassword;

  Locale({
    this.userLogin,
    this.userPassword,
  });

  factory Locale.fromJson(Map<String, dynamic> json) {
    return Locale(
      userLogin: json['userLogin'],
      userPassword: json['userPassword'],
    );
  }
}

class LocalUsers extends TypeAdapter<Locale> {
  @override
  final typeId = 1;

  @override
  Locale read(BinaryReader reader) {
    return Locale()
      ..userLogin = reader.read()
      ..userPassword = reader.read();
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer.write(obj.userLogin);
    writer.write(obj.userPassword);
  }
}
