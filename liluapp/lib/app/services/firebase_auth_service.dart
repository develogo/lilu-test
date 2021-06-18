import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liluapp/app/modules/login/models/user_dto.dart';
import 'package:liluapp/app/services/errors/auth_service_error.dart';
import 'package:liluapp/app/services/interfaces/firebase_auth_service_interface.dart';
import 'package:liluapp/app/shared/models/user_model.dart';

class FirebaseAuthService implements ILoginAuthService {
  final FirebaseAuth auth;

  FirebaseAuthService(this.auth);

  @override
  Future<UserModel> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<Either<AuthFailure, UserModel>> signInWithEmailAndPassword(
      UserDTO creds) async {
    try {
      var data = await auth.signInWithEmailAndPassword(
          email: creds.login, password: creds.password);

      if (data.user != null) {
        var token = await auth.currentUser?.getIdToken();
        var user = UserModel(
          name: data.user?.displayName ?? 'No name',
          email: data.user!.email!,
          token: token!,
        );
        return Right(user);
      } else {
        return Left(AuthFailure());
      }
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure(message: e.code.toString()));
    } catch (e) {
      return Left(LoginFailure(message: e.toString()));
    }
  }
}
