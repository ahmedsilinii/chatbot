import 'package:chatbot/message.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello", isUser: false),
    Message(text: "Yoyys", isUser: true),
    Message(text: "Boom", isUser: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 4.0, 
        // ignore: deprecated_member_use
        shadowColor: Colors.grey.withOpacity(0.5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Row(
          children: [
            Image.asset('assets/gpt-robot.png'),
            SizedBox(width: 8),
            Text(
          'Tnaffes GPT',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
            ),
          ],
        ),
        Image.asset('assets/volume-high.png', color: Colors.blue[800]),
          ],
        ),
      ),
      body: Column(
        children: [
          //msg list
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Align(
                    alignment:
                        message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: message.isUser ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          //input field
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32.0,
              left: 16.0,
              right: 16.0,
            ),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Type a message",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Image.asset('assets/send.png'),
                      onTap: () {},
                    ),
                  ),
                ], 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
