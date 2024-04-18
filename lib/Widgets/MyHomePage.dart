// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/Lobby.dart';
import 'package:flutter_application_1/Widgets/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Widgets/Settings.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSearching = false;
  int selectedIndex = 0;
  final screens = [LoginPage(), const Lobby(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: selectedIndex == 1
          ? AppBar(
              backgroundColor: Colors.red.shade400,
              title: !isSearching
                  ? Text("")
                  : TextField(
                      style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white))),
              actions: <Widget>[
                isSearching
                    ? IconButton(
                        icon: Icon(
                          Icons.cancel_sharp,
                          size: 37.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isSearching = !isSearching;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 37.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            this.isSearching = !this.isSearching;
                          });
                        },
                      )
              ],
            )
          : null,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.grey.shade800,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        letIndexChange: (index) => true,
        items: [
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.add, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
