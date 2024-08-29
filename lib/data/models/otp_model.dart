import 'dart:convert';

class OTPModel {
  String status;

  OTPModel({required this.status});

  factory OTPModel.fromJson(String source) {
    Map details = json.decode(source);
    return OTPModel(status: details['status']);
  }
}
