import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/Page1.dart';
import 'pages/Page2.dart';
import 'pages/Page3.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
