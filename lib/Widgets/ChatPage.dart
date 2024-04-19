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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color(0xFF101010),
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
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cliente.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.8,
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final messageStyle = theme.textTheme.bodyText1;
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
                              style: messageStyle,
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
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
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
