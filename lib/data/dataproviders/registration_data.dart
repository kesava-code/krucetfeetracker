import 'dart:convert';

class RegistrationApi {
  Future<String> postData({required String data}) async {
    Map details = jsonDecode(data);
    if (details['registerID'] == "y19cse279017" &&
        details['aadhaar'] == "352215560286") {
      Map jsonFile = {};
      jsonFile['email'] = "mogantikesava@gmail.com";
      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    } else {
      return "";
    }
  }

  Future postOTP({required String email}) async {}
}
