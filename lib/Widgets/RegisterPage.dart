import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/LoginPage.dart';
import 'package:flutter_application_1/Widgets/MyHomePage.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool cliente = true;
  bool escolta = false;
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0, // Para eliminar la sombra
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.email),
                                labelText: 'Email',
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
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.account_circle),
                                labelText: 'User',
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
                              style: TextStyle(color: Colors.white),
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
                            SizedBox(height: 20),
                            TextField(
                              cursorColor: Color(0xFFEF315D),
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.verified),
                                labelText: 'Confirm Password',
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEF315D),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()),
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Choose your type',
                                style: GoogleFonts.oleoScript(
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w700,
                                  textStyle: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Visibility(
                                      visible: cliente ? isvisible : !isvisible,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xFFEF315D),
                                        size: size.width * 0.08,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cliente = true;
                                          escolta = false;
                                        });
                                      },
                                      icon: Image.asset(
                                          'assets/images/cliente.png',
                                          width: size.width * 0.3)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Visibility(
                                      visible: escolta ? isvisible : !isvisible,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xFFEF315D),
                                        size: size.width * 0.08,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          escolta = true;
                                          cliente = false;
                                        });
                                      },
                                      icon: Image.asset(
                                          'assets/images/escolta.png',
                                          width: size.width * 0.3)),
                                ],
                              ),
                            ],
                          ),
                        ],
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
