import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/tag-logo.png')),
            const SizedBox(height: 20),
            Text(titulo, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
