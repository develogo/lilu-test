import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';
import 'package:liluapp/app/modules/home/repositories/interfaces/contact_repository_interface.dart';
import 'package:liluapp/app/services/interfaces/local_storage_service_interface.dart';
import 'package:liluapp/app/shared/http/exeptions/contact_repository_error.dart';

class ContactRepository implements IContactRepository {
  final FirebaseAuth auth;
  final ILocalStorageService _preferences;

  ContactRepository(this.auth, this._preferences);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<Either<ContactFailure, List<ContactModel>>> getAllContacts() async {
    try {
      var token = await _preferences.get('token');

      var response = await Dio().post(
        'http://localhost:8080/getAllContacts',
        options: Options(
          headers: {"Content-Type": "application/json", "Authorization": token},
        ),
      );

      var contacts = ContactModel.fromJsonList(response.data);

      return Right(contacts);
    } catch (e) {
      return Left(ContactFailure());
    }
  }

  @override
  Future<Either<ContactFailure, bool>> addContact(ContactModel contact) async {
    try {
      var token = await _preferences.get('token');

      var response = await Dio().post(
        'http://localhost:8080/addcontact',
        data: {
          "name": contact.name,
          "email": contact.email,
          "phone": contact.phone
        },
        options: Options(
          headers: {"Content-Type": "application/json", "Authorization": token},
        ),
      );

      if (response.data["success"] == true) {
        return Right(true);
      } else {
        return Left(AddFailure(message: response.data["message"]));
      }
    } catch (e) {
      return Left(AddFailure(message: "Error"));
    }
  }

  @override
  Future<Either<ContactFailure, bool>> deleteContact(String id) async {
    try {
      var token = await _preferences.get('token');

      var response = await Dio().post(
        'http://localhost:8080/deletecontact',
        data: {
          "id": id,
        },
        options: Options(
          headers: {"Content-Type": "application/json", "Authorization": token},
        ),
      );
      if (response.data == true) {
        return Right(true);
      } else {
        return Left(DeleteFailure());
      }
    } catch (e) {
      return Left(DeleteFailure());
    }
  }

  @override
  Future<Either<ContactFailure, bool>> updateContact(
      ContactModel contact) async {
    try {
      var token = await _preferences.get('token');

      var response = await Dio().post(
        'http://localhost:8080/updatecontact',
        data: {
          "id": contact.id,
          "name": contact.name,
          "email": contact.email,
          "phone": contact.phone
        },
        options: Options(
          headers: {"Content-Type": "application/json", "Authorization": token},
        ),
      );

      if (response.data["success"] == true) {
        return Right(true);
      } else {
        return Left(UpdateFailure(message: response.data["message"]));
      }
    } catch (e) {
      return Left(UpdateFailure(message: "Error"));
    }
  }
}
