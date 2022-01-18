import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
var dio = Dio();
var db;

Map<String,dynamic> admin = {
  'login': 'admin',
  'password': 'admin',
};


List<Map<String,dynamic>> userLibrary = [];