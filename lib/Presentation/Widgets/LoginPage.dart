import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Widgets/MyHomePage.dart';
import 'package:flutter_application_1/Presentation/Widgets/RegisterPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'May Day',
                  style: GoogleFonts.oleoScript(
                    fontSize: size.height * 0.08,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        cursorColor: Color(0xFFEF315D),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.account_circle),
                          labelText: 'Email or User',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEF315D)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        cursorColor: Color(0xFFEF315D),
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFEF315D)),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEF315D),
                      ),
                      onPressed: () {
                        _login();
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                        color: Color(0xFF6750a4),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF6750a4)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para autenticar al usuario
  _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      Map<String, dynamic> userData = jsonDecode(userDataJson);
      String email = userData['email'];
      String password = userData['password']; // Obtén la contraseña almacenada
      if (emailController.text == email &&
          passwordController.text == password) {
        // Si la información del usuario y la contraseña coinciden, redirecciona al usuario a la página principal
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        // Si la información del usuario y la contraseña no coinciden, muestra un mensaje de error
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(
                  "Credenciales incorrectas. Por favor, inténtalo de nuevo."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Si no hay datos de usuario almacenados, muestra un mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("No hay usuarios registrados."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
