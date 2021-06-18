import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';
import 'package:liluapp/app/shared/http/exeptions/contact_repository_error.dart';

abstract class IContactRepository implements Disposable {
  Future<Either<ContactFailure, List<ContactModel>>> getAllContacts();
  Future<Either<ContactFailure, bool>> addContact(ContactModel contact);
  Future<Either<ContactFailure, bool>> updateContact(ContactModel contact);
  Future<Either<ContactFailure, bool>> deleteContact(String id);
}
