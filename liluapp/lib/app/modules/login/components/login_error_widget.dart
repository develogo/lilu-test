import 'package:flutter/material.dart';

class LoginErrorWidget extends StatelessWidget {
  final String title;
  const LoginErrorWidget({Key? key, required this.title}) : super(key: key);

  static const Map<String, dynamic> errors = {
    "user-not-found": {
      "code": "user-not-found",
      "title": "Usuario não encontrado",
      "message": "Usuário inexistente",
    },
    "wrong password": {
      "code": "wrong password",
      "title": "Senha Incorreta",
      "message": "Contacte o administrador",
    }
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.white,
            size: 26,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                errors[title]?['title'] ?? title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                errors[title]?['message'] ?? 'Error 0001',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
