// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_contact_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditContactStore on _EditContactStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_EditContactStoreBase.isValid'))
      .value;

  final _$idAtom = Atom(name: '_EditContactStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nameAtom = Atom(name: '_EditContactStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_EditContactStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_EditContactStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$_EditContactStoreBaseActionController =
      ActionController(name: '_EditContactStoreBase');

  @override
  dynamic setId(String value) {
    final _$actionInfo = _$_EditContactStoreBaseActionController.startAction(
        name: '_EditContactStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_EditContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_EditContactStoreBaseActionController.startAction(
        name: '_EditContactStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_EditContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_EditContactStoreBaseActionController.startAction(
        name: '_EditContactStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_EditContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$_EditContactStoreBaseActionController.startAction(
        name: '_EditContactStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_EditContactStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
phone: ${phone},
isValid: ${isValid}
    ''';
  }
}
