import 'package:flutter_test/flutter_test.dart';
import 'package:liluapp/app/modules/home/pages/edit_contact/edit_contact_store.dart';
 
void main() {
  late EditContactStore store;

  setUpAll(() {
    store = EditContactStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}