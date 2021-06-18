import 'package:flutter/material.dart';
import 'package:liluapp/app/constants.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  const LoginButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kMainColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text('Teste'),
      ),
    );
  }
}
