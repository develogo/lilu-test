import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layouts/login_page_desktop.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  void initState() {
    store.checkLoggedInUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => Container(color: Colors.blue),
      tablet: (BuildContext context) => Container(color: Colors.yellow),
      desktop: (BuildContext context) => LoginPageDesktop(),
      watch: (BuildContext context) => Container(color: Colors.purple),
    );
  }
}
