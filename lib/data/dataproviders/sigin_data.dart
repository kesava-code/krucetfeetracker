import 'dart:convert';

class SignInApi {
  Future<String> postData({required String data}) async {
    Map details = jsonDecode(data);
    if (details['registerID'] == "y19cse279017" &&
        details['password'] == "kesava.2002") {
      Map jsonFile = {};
      jsonFile['email'] = "mogantikesava@gmail.com";
      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    } else {
      return "";
    }
  }

  
}
