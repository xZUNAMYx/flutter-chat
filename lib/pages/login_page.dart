import 'package:chat/helpers/helpers.dart';
import 'package:chat/services/services.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Logo(titulo: 'Agendate App'),
                _Form(),
                Labels(
                    ruta: 'register',
                    labelIngresar1: '¿Olvidaste tu contraseña?',
                    labelIngresar2: 'Recuperar contraseña'),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthSerice>(context);

    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputWidget(
            icon: Icons.email_outlined,
            isPassword: false,
            keyBoardType: TextInputType.emailAddress,
            placeholder: 'Email',
            textController: emailCtrl,
          ),
          CustomInputWidget(
            icon: Icons.lock_outline_rounded,
            isPassword: true,
            placeholder: 'Password',
            textController: passCtrl,
          ),
          BtnBlueWidget(
            text: 'Ingresar',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    //QUitar teclado de pantalla
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    );

                    if (loginOk) {
                      // TODO: Navegar a otra pantalla
                      // Navigator.pushReplacementNamed(context, 'users');
                      print('login correcto');
                    } else {
                      print('login incorrecto');
                      // Mostrar alerta
                      // showAlert(
                      //   context,
                      //   'Login incorrecto',
                      //   'Revise sus datos nuevamente',
                      // );
                    }
                  },
          )
        ],
      ),
    );
  }
}
