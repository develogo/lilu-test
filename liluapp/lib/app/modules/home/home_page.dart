import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/home/home_store.dart';
import 'package:liluapp/app/modules/home/layouts/home_page_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.loadContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => HomePageDesktop(),
      tablet: (BuildContext context) => HomePageDesktop(),
      desktop: (BuildContext context) => HomePageDesktop(),
      watch: (BuildContext context) => Container(color: Colors.purple),
    );
  }
}
