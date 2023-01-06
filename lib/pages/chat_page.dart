import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: const [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text('TE', style: TextStyle(fontSize: 15)),
              ),
              SizedBox(height: 3),
              Text('Andres Felipe',
                  style: TextStyle(color: Colors.black, fontSize: 15))
            ],
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, i) => Text('$i'),
                  reverse: true,
                ),
              ),
              const Divider(height: 1),
              Container(
                color: Colors.white,
                height: 100,
              ),
            ],
          ),
        ));
  }
}
