import 'package:flutter/material.dart';

class LogindividerWidget extends StatelessWidget {
  const LogindividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: .7,
              color: Colors.black26,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Credenciais',
              style: TextStyle(
                color: Colors.black26,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: .7,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}
