import 'dart:convert';

import 'package:krucetfeetracker/data/dataproviders/otp_data.dart';

import '../models/otp_model.dart';

class OTPRepo {
  final OTPApi api = OTPApi();
  Future<OTPModel> getOTP({
    required OTP,
    required email
  }) async {
    Map<String, String> OTPDetails = {};
    OTPDetails['otp'] = OTP;
    OTPDetails['email'] = email;

    final String jsonEmail = await api.postData(data: toJson(OTPDetails));
    return OTPModel.fromJson(jsonEmail);
  }

  String toJson(Map<String, String> details) {
    return jsonEncode(details);
  }
}
