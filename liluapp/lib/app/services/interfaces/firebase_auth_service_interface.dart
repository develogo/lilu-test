import 'package:dartz/dartz.dart';
import 'package:liluapp/app/modules/login/models/user_dto.dart';
import 'package:liluapp/app/services/errors/auth_service_error.dart';
import 'package:liluapp/app/shared/models/user_model.dart';

abstract class ILoginAuthService {
  Future<Either<AuthFailure, UserModel>> signInWithEmailAndPassword(
      UserDTO creds);

  Future<UserModel> currentUser();

  Future<void> logout();
}
