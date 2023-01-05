import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(
      {Key? key,
      required this.ruta,
      required this.labelIngresar1,
      required this.labelIngresar2})
      : super(key: key);

  final String ruta;
  final String labelIngresar1;
  final String labelIngresar2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(labelIngresar1,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          GestureDetector(
            child: Text(
              labelIngresar2,
              style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, ruta);
            },
          ),
        ],
      ),
    );
  }
}
