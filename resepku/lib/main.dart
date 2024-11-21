import 'package:flutter/material.dart';
import 'package:resepku/login_page.dart';
import 'package:resepku/views/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomeScreenRecipe.tag: (context) => HomeScreenRecipe(username: ''),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
