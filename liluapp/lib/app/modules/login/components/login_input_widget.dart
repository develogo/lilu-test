import 'package:flutter/material.dart';

class LoginInputWidget extends StatelessWidget {
  final String title;
  final Function(String value) onChanged;
  final bool obscureText;
  const LoginInputWidget(
      {Key? key,
      required this.title,
      required this.onChanged,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 5),
          TextField(
            onChanged: onChanged,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26, width: .8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: .8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          )
        ],
      ),
    );
  }
}
