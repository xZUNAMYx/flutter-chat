import 'package:flutter/material.dart';

class ChatMesageWidget extends StatelessWidget {
  const ChatMesageWidget(
      {super.key,
      required this.uid,
      required this.texto,
      required this.animationController});

  final String uid;
  final String texto;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid == '123' ? _myMessage() : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 30, right: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xff4D9EF6),
            borderRadius: BorderRadius.circular(20)),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5,
          left: 5,
          right: 30,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xffE4E5E8),
            borderRadius: BorderRadius.circular(20)),
        child: Text(texto, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
