import 'dart:convert';

import 'package:krucetfeetracker/data/dataproviders/fee_data.dart';
import 'package:krucetfeetracker/data/dataproviders/student_data.dart';

import '../models/fee_model.dart';

class FeeRepo {
  final FeeDetailsAPI api = FeeDetailsAPI();
  Future<FeeModel> getFeeDetails({required referenceID}) async {
    Map<String, String> referenceDetails = {};
    referenceDetails['referenceID'] = referenceID;
    final String jsonEmail = await api.postData(data: toJson(referenceDetails));
    return FeeModel.fromJson(jsonEmail);
  }

  String toJson(Map<String, String> details) {
    return jsonEncode(details);
  }
}
