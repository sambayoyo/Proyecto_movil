import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Widgets/MyHomePage.dart';
import 'package:flutter_application_1/Presentation/Widgets/RegisterPage.dart';
import 'package:flutter_application_1/Presentation/Widgets/loginpage.dart';

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
        home: LoginPage(), // Aquí estableces LoginPage como la pantalla inicial
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => MyHomePage(),
          '/register': (context) => RegisterPage(),
        });
  }
}
