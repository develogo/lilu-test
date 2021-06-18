class ContactFailure implements Exception {}

class GetAllFailure extends ContactFailure {
  final String message;

  GetAllFailure({required this.message});
}

class AddFailure extends ContactFailure {
  final String message;

  AddFailure({required this.message});
}

class UpdateFailure extends ContactFailure {
  final String message;

  UpdateFailure({required this.message});
}

class DeleteFailure extends ContactFailure {}
