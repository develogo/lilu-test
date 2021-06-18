import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/constants.dart';
import 'package:liluapp/app/modules/login/components/login_button_widget.dart';
import 'package:liluapp/app/modules/login/components/login_divider_widget.dart';
import 'package:liluapp/app/modules/login/components/login_error_widget.dart';
import 'package:liluapp/app/modules/login/components/login_header_widget.dart';
import 'package:liluapp/app/modules/login/components/login_input_widget.dart';
import 'package:liluapp/app/modules/login/login_store.dart';

class LoginPageDesktop extends StatefulWidget {
  const LoginPageDesktop({Key? key}) : super(key: key);

  @override
  _LoginPageDesktopState createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState extends State<LoginPageDesktop> {
  final store = Modular.get<LoginStore>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: 1080,
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        width: double.maxFinite,
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 8),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginHeaderWidget(),
                              SizedBox(height: 100),
                              LogindividerWidget(),
                              SizedBox(height: 10),
                              Observer(
                                builder: (context) => store.errorMessage.isEmpty
                                    ? SizedBox()
                                    : LoginErrorWidget(
                                        title: store.errorMessage,
                                      ),
                              ),
                              SizedBox(height: 30),
                              LoginInputWidget(
                                title: "Email *",
                                onChanged: (value) => store.setEmail(value),
                              ),
                              SizedBox(height: 20),
                              LoginInputWidget(
                                title: "Senha *",
                                obscureText: true,
                                onChanged: (value) => store.setPassword(value),
                              ),
                              SizedBox(height: 50),
                              Observer(
                                builder: (_) => LoginButtonWidget(
                                  onPressed: store.validForm
                                      ? () => store.getuser()
                                      : null,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Flexible(
                    flex: 1,
                    child: Container(
                      color: kMainColor,
                      child: Center(
                          child: Image.asset(
                        'assets/images/lilu.jpg',
                        height: 300,
                        fit: BoxFit.scaleDown,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
