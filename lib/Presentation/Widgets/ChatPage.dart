import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Theme.of(context);

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Chats',
            style: GoogleFonts.oleoScript(
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.w700,
              textStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.8,
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final messageBubble = Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: message.startsWith('You')
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: message.startsWith('You')
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: message.startsWith('You')
                                    ? Radius.circular(0)
                                    : Radius.circular(12),
                                bottomRight: message.startsWith('You')
                                    ? Radius.circular(12)
                                    : Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              message,
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    );
                    return messageBubble;
                  },
                ),
              ),
              Container(
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(
                            color: Colors
                                .black), // Establece el color del texto en negro
                        cursorColor: Color(
                            0xFFEF315D), // Establece el color del cursor en rojo (puedes elegir el color que desees)
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: TextStyle(
                              color: Colors
                                  .grey), // Establece el color del texto de sugerencia en gris
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors
                              .white, // Establece el color de fondo del TextField en blanco
                        ),
                      ),
                    ),
                    IconButton(
                      color: Color(0xFFEF315D),
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final message = _controller.text;
                        if (message.isNotEmpty) {
                          setState(() {
                            _messages.add('You: $message');
                            _controller.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
