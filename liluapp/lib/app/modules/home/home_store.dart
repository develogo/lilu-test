import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';
import 'package:liluapp/app/modules/home/repositories/contact_repository.dart';
import 'package:liluapp/app/services/interfaces/local_storage_service_interface.dart';
import 'package:liluapp/app/shared/http/exeptions/contact_repository_error.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ContactRepository _repository;
  final ILocalStorageService _localStorageService;

  HomeStoreBase(this._repository, this._localStorageService);

  @observable
  ObservableList<ContactModel> contacts = <ContactModel>[].asObservable();

  //Error
  late ContactFailure contactsError;

  @action
  loadContacts() async {
    var data = await _repository.getAllContacts();

    data.fold((l) => contactsError = l, (r) {
      contacts = r.asObservable();
    });
  }

  @action
  Future<bool> deleteContact(String id) async {
    var deleted = await _repository.deleteContact(id);

    if (deleted.isRight()) {
      return true;
    } else {
      return false;
    }
  }

  @action
  logout() async {
    await _localStorageService.delete('token');
    Modular.to.navigate('/');
  }
}
