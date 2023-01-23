import 'package:flutter/material.dart';

import 'package:chat/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                Logo(titulo: 'Registrar'),
                _Form(),
                Labels(
                    ruta: 'login',
                    labelIngresar1: '¿Ya tienes cuenta?',
                    labelIngresar2: 'Iniciar sesión'),
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
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInputWidget(
            icon: Icons.supervised_user_circle_outlined,
            isPassword: false,
            keyBoardType: TextInputType.text,
            placeholder: 'Nombre',
            textController: nameCtrl,
          ),
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
            placeholder: 'Contraseña',
            textController: passCtrl,
          ),
          BtnBlueWidget(
            text: 'Ingresar',
            onPressed: () {
              print(emailCtrl.text);
              print(passCtrl.text);
            },
          )
        ],
      ),
    );
  }
}
