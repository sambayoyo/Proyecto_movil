import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color(0xFF101010),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/escolta.png')),
                  Text(
                    'Escolta1',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
