// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/Page1.dart';
import 'pages/Page2.dart';
import 'pages/Page3.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSearching = false;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                        this.isSearching = !this.isSearching;
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
        ),
        body: Column(
          children: [
            Container(
              height: 280.0,
              decoration: BoxDecoration(
                color: Colors.red.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(250.0),
                  bottomRight: Radius.circular(250.0),
                ),
              ),
              child: Center(
                child: Text(
                  'May Day',
                  style: GoogleFonts.oleoScript(
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 400.0,
                  width: 300.0,
                  child: PageView(
                    controller: _controller,
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.grey.shade800,
          onTap: (index) {},
          items: [
            Icon(Icons.wallet, color: Colors.white),
            Icon(Icons.add, color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
