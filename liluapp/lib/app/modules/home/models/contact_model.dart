import 'dart:convert';

class ContactModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  ContactModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
  static List<ContactModel> fromJsonList(List list) {
    return list
        .map<ContactModel>((item) => ContactModel.fromMap(item))
        .toList();
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactModel(id: $id, name: $name, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ phone.hashCode;
  }
}
