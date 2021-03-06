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
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('COVID-19',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),),
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
