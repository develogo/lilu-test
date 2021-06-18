import 'package:flutter_modular/flutter_modular.dart';

class MyGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) {
    if (url != '/admin') {
      // Return `true` to allow access
      return Future.value(true);
    } else {
      // Return `false` to disallow access
      return Future.value(false);
    }
  }

  @override
  // TODO: implement guardedRoute
  String? get guardedRoute => throw UnimplementedError();
}
