import 'package:enter_engineering_test/blocs/blocs.dart';
import 'package:enter_engineering_test/services/repositories.dart';
import 'package:enter_engineering_test/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        title: 'Enter Engineering',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: Splash.routeName,
        routes: {
          Splash.routeName: (context) => const Splash(),
          Home.routeName: (context) => Home(),
          Registration.routeName: (context) => Registration(),
          Login.routeName: (context) => Login(),
          CovidPage.routeName: (context) => CovidPage(),
        },
      ),
    );
  }
}
