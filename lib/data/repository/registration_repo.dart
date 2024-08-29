import 'dart:convert';

import 'package:krucetfeetracker/data/dataproviders/registration_data.dart';

import '../models/registration_model.dart';

class RegistrationRepo {
  final RegistrationApi api = RegistrationApi();
  Future<RegistrationModel> getEmail(
      {required registerID, required aadhaar, required password}) async {
    Map<String, String> registerDetails = {};
    registerDetails['registerID'] = registerID;
    registerDetails['aadhaar'] = aadhaar;
    registerDetails['password'] = password;
    final String jsonEmail = await api.postData(data: toJson(registerDetails));
    return RegistrationModel.fromJson(jsonEmail);
  }

  String toJson(Map<String, String> details) {
    return jsonEncode(details);
  }
}
