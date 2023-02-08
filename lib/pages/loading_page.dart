import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chat/services/services.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthSerice>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      // TODO: Conectar al socket server
      Navigator.pushReplacementNamed(context, 'users');
      // Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: pageBuilder)) Para hacerlo con animaciones a futuro  mejor transicion
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
}
