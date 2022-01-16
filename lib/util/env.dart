import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

Map<String,dynamic> admin = {
  'login': 'admin',
  'password': 'admin',
};


List<Map<String,dynamic>> userLibrary = [];