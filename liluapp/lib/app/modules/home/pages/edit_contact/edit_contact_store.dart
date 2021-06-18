import 'package:dartz/dartz.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';
import 'package:liluapp/app/modules/home/repositories/interfaces/contact_repository_interface.dart';
import 'package:liluapp/app/shared/http/exeptions/contact_repository_error.dart';
import 'package:mobx/mobx.dart';

part 'edit_contact_store.g.dart';

class EditContactStore = _EditContactStoreBase with _$EditContactStore;

abstract class _EditContactStoreBase with Store {
  final IContactRepository _repository;
  _EditContactStoreBase(this._repository);

  @observable
  String id = '';

  @action
  setId(String value) => id = value;

  @observable
  String name = '';
  @action
  setName(String value) => name = value;

  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;

  @observable
  String phone = '';
  @action
  setPhone(String value) => phone = value;

  @computed
  bool get isValid => name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty;

  Future<dynamic> updateOrSave() async {
    if (id.isNotEmpty) {
      ContactModel c =
          ContactModel(id: id, name: name, email: email, phone: phone);

      var update = await _repository.updateContact(c);
      late final added;
      update.fold((l) {
        if (l is UpdateFailure) {
          return added = UpdateFailure(message: l.message);
        }
        return added = UpdateFailure(message: "Error");
      }, (r) {
        return added = true;
      });

      return added;
    } else {
      ContactModel c =
          ContactModel(id: '', name: name, email: email, phone: phone);
      var add = await _repository.addContact(c);
      late final added;
      add.fold((l) {
        if (l is AddFailure) {
          return added = AddFailure(message: l.message);
        }
        return added = AddFailure(message: "Error");
      }, (r) {
        return added = true;
      });

      return added;
    }
  }
}
