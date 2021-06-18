import 'package:liluapp/app/modules/home/pages/edit_contact/edit_contact_store.dart';
import 'package:liluapp/app/modules/home/repositories/contact_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/home/pages/edit_contact/edit_contact_page.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EditContactStore(i.get())),
    Bind.lazySingleton((i) => ContactRepository(i.get(), i.get())),
    Bind.lazySingleton((i) => HomeStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute(
      '/edit',
      child: (_, args) => EditContactPage(contactModel: args.data),
    )
  ];
}
