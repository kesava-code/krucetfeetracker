import 'dart:convert';

class StudentDetailsAPI {
  Future<String> postData({required String data}) async {
    Map details = jsonDecode(data);
    if (details['registerID'] == "y19cse279017") {
      Map jsonFile = {};
      jsonFile['emailID'] = "mogantikesava@gmail.com";
      jsonFile['registerID'] = "y19cse279017";
      jsonFile['name'] = "Moganti Mohan Kesava";
      jsonFile['mobile'] = "9441719386";
      jsonFile['batch'] = "2023";
      jsonFile['course'] = "CSE";
      jsonFile['dateOfBirth'] = "15/07/2002";
      jsonFile['category'] = "OC";
      jsonFile['feePaid'] = "105000";
      jsonFile['feeAmount'] = "105000";
      jsonFile['aadhaar'] = "352215560286";
      jsonFile['referenceIDs'] = ['DUI123', 'DUI234', 'DUI456'];

      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    } else {
      return "";
    }
  }
}
