import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://192.168.1.72:3000/api'
      : 'http://localhost:3000/api';
  // 192.168.1.72     190.248.0.1
  // 10.0.2.2

  static String socketUrl =
      Platform.isAndroid ? 'http://192.168.1.72:3000' : 'http://localhost:3000';
}
