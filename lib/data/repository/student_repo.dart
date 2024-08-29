import 'dart:convert';

import 'package:krucetfeetracker/data/dataproviders/student_data.dart';

import '../models/Student_model.dart';

class StudentRepo {
  final StudentDetailsAPI api = StudentDetailsAPI();
  Future<StudentModel> getStudentDetails(
      {required registerID}) async {
    Map<String, String> registerDetails = {};
    registerDetails['registerID'] = registerID;
    final String jsonEmail = await api.postData(data: toJson(registerDetails));
    return StudentModel.fromJson(jsonEmail);
  }

  String toJson(Map<String, String> details) {
    return jsonEncode(details);
  }
}
