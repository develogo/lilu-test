import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errors/auth_service_error.dart';
import 'interfaces/local_storage_service_interface.dart';

class LocalStorageService implements ILocalStorageService {
  @override
  Future<bool> delete(String key) async {
    try {
      var shared = await SharedPreferences.getInstance();
      bool deleted = await shared.remove(key);
      return deleted ? true : false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future<bool> put(String key, value) async {
    try {
      var shared = await SharedPreferences.getInstance();
      if (value is bool) {
        var puted = await shared.setBool(key, value);
        return puted ? true : false;
      } else if (value is String) {
        var puted = await shared.setString(key, value);
        return puted ? true : false;
      } else if (value is int) {
        var puted = await shared.setInt(key, value);
        return puted ? true : false;
      } else if (value is double) {
        var puted = await shared.setDouble(key, value);
        return puted ? true : false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
