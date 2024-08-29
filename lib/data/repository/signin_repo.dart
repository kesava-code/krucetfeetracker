import 'dart:convert';
import 'package:krucetfeetracker/data/dataproviders/sigin_data.dart';
import 'package:krucetfeetracker/data/models/signin_model.dart';


class SignInRepo {
  final SignInApi api = SignInApi();
  Future<SignInModel> getEmail(
      {required registerID, required password}) async {
    Map<String, String> registerDetails = {};
    registerDetails['registerID'] = registerID;
    registerDetails['password'] = password;
    final String jsonEmail = await api.postData(data: toJson(registerDetails));
    return SignInModel.fromJson(jsonEmail);
  }

  String toJson(Map<String, String> details) {
    return jsonEncode(details);
  }
}
