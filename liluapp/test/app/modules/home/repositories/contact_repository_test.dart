import 'package:flutter_test/flutter_test.dart';
import 'package:liluapp/app/modules/home/repositories/contact_repository.dart';
 
void main() {
  late ContactRepository repository;

  setUpAll(() {
    repository = ContactRepository();
  });
}