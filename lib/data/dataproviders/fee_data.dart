import 'dart:convert';

class FeeDetailsAPI {
  Future<String> postData({required String data}) async {
    Map details = jsonDecode(data);
    if (details['referenceID'] == "DUI123") {
      Map jsonFile = {};
      jsonFile['referenceID'] = "DUI123";
      jsonFile['registerID'] = "y19cse279017";
      jsonFile['name'] = "Moganti Mohan Kesava";
      jsonFile['amount'] = "9441";
      jsonFile['remarks'] = "JVD 2ND PHASE";
      jsonFile['dateOfPayment'] = "20/07/2021";
      await Future.delayed(const Duration(seconds: 5));
      return jsonEncode(jsonFile);
    } else {
      return "";
    }
  }
}
