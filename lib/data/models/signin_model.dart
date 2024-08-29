import 'dart:convert';

class SignInModel {
  String email;

  SignInModel({required this.email});

  factory SignInModel.fromJson(String source) {
    Map details = json.decode(source);
    return SignInModel(email: details['email']);
  }
}
