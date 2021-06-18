import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/login/models/user_dto.dart';
import 'package:liluapp/app/services/errors/auth_service_error.dart';
import 'package:liluapp/app/services/interfaces/firebase_auth_service_interface.dart';
import 'package:liluapp/app/services/interfaces/local_storage_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginAuthService _authService;
  final ILocalStorageService _localStorageService;
  _LoginStoreBase(this._authService, this._localStorageService);

  @observable
  bool loading = false;

  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;

  @computed
  bool get validForm => email.isNotEmpty && password.isNotEmpty;

  @observable
  String errorMessage = "";

  @action
  getuser() async {
    try {
      loading = true;
      var user = UserDTO(login: email, password: password);
      var data = await _authService.signInWithEmailAndPassword(user);

      data.fold((l) {
        if (l is LoginFailure) {
          errorMessage = l.message;
        }
      }, (r) async {
        await _localStorageService.put('token', r.token);
        return Modular.to.navigate('/home');
      });
    } catch (e) {} finally {
      loading = false;
    }
  }

  checkLoggedInUser() async {
    var token = await _localStorageService.get('token');
    if (token != null) {
      return Modular.to.navigate('/home');
    }
  }
}
