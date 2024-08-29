import 'dart:convert';

class OTPApi {
  Future<String> postData({required String data}) async {
    Map details = jsonDecode(data);
    if (details['otp'] == "2002" && details["email"] == "mogantikesava@gmail.com") {
      Map jsonFile = {};
      jsonFile['status'] = "success";
      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    } else {
       Map jsonFile = {};
      jsonFile['status'] = "failed";
      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    }
  }

  Future postOTP({required String email}) async {}
}
