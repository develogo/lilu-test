import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/constants.dart';
import 'package:liluapp/app/modules/login/login_module.dart';
import 'package:liluapp/app/shared/routers_guards/home_guard.dart';

import 'modules/home/home_module.dart';
import 'services/firebase_auth_service.dart';
import 'services/local_storage_service.dart';
import 'shared/http/custom_dio.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FirebaseAuth.instance),
    Bind((i) => FirebaseAuthService(i.get())),
    Bind.lazySingleton((i) => LocalStorageService()),
    Bind((i) => CustomDIO(i.get())),
    Bind(
      (i) => BaseOptions(
        baseUrl: kBaseUrl,
        connectTimeout: 8000,
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(
      '/home',
      module: HomeModule(),
      guards: [MyGuard()],
      guardedRoute: '/',
    ),
  ];
}
