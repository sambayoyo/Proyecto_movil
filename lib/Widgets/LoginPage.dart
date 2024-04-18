// ignore: file_names
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'RegisterPage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Column(
                          children: [
                            TextField(
                              cursorColor: Color(0xFFEF315D),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.account_circle),
                                labelText: 'Email or User',
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEF315D)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              cursorColor: Color(0xFFEF315D),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFEF315D)),
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
                          TextButton(
                            onPressed: () {
                              // Lógica para "Forgot password?"
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEF315D),
                            ),
                            onPressed: () {
                              // Lógica para "SIGN IN"
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
                          // Navegar a la página de registro
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
