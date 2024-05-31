import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
              color: Color(0xFFEF315D),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(250.0),
                bottomRight: Radius.circular(250.0),
              ),
            ),
            child: Center(
              child: Text(
                'May Day',
                style: GoogleFonts.oleoScript(
                  fontSize: size.height * 0.05,
                  fontWeight: FontWeight.w700,
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.4,
                width: size.width * 0.6,
                child: PageView(
                  controller: _controller,
                  children: const [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SwapEffect(
                  activeDotColor: Color(0xFFEF315D),
                  spacing: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
