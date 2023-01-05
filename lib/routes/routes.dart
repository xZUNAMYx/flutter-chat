import 'package:flutter/material.dart';

import 'package:chat/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => const UsersPage(),
  'register': (_) => const RegisterPage(),
  'chat': (_) => const ChatPage(),
  'loading': (_) => const LoadingPage(),
  'login': (_) => const LoginPage(),
};
