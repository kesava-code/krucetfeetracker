import 'dart:convert';

class RegistrationModel {
  final String email;

  RegistrationModel({required this.email});

  factory RegistrationModel.fromJson(String source) {
    Map details = json.decode(source);
    return RegistrationModel(email: details['email']);
  }
}
