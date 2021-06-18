// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$contactsAtom = Atom(name: 'HomeStoreBase.contacts');

  @override
  ObservableList<ContactModel> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<ContactModel> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$loadContactsAsyncAction = AsyncAction('HomeStoreBase.loadContacts');

  @override
  Future loadContacts() {
    return _$loadContactsAsyncAction.run(() => super.loadContacts());
  }

  final _$deleteContactAsyncAction = AsyncAction('HomeStoreBase.deleteContact');

  @override
  Future<bool> deleteContact(String id) {
    return _$deleteContactAsyncAction.run(() => super.deleteContact(id));
  }

  final _$logoutAsyncAction = AsyncAction('HomeStoreBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
contacts: ${contacts}
    ''';
  }
}
