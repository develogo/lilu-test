import 'package:dartz/dartz.dart';
import 'package:liluapp/app/services/errors/auth_service_error.dart';

abstract class ILocalStorageService {
  Future get(String key);
  Future<bool> delete(String key);
  Future<bool> put(String key, dynamic value);
}
