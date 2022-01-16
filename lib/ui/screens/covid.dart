import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CovidPage extends StatefulWidget {
  static const routeName = 'covidScreen';

  CovidPage({Key? key}) : super(key: key);

  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('COVID-19'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: WebView(
          initialUrl: 'https://www.ent-en.com/ru/covid-19.php',
        ),
      ),
    );
  }
}
