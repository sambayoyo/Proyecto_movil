import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/ChatPage.dart';
import 'package:flutter_application_1/Widgets/LoginPage.dart';
import 'package:flutter_application_1/Widgets/MyHomePage.dart';
import 'package:flutter_application_1/Widgets/RegisterPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        // A widget which will be started on application startup
        home: ChatPage(), // Aquí estableces LoginPage como la pantalla inicial
        routes: {
          '/home': (context) => MyHomePage(),
          '/login': (context) => LoginPage(),
        });
  }
}
