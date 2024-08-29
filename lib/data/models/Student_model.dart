import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class StudentModel extends Equatable {
  String registerID;
  String name;
  String emailID;
  String mobile;
  String batch;
  String course;
  String dateOfBirth;
  String category;
  String feePaid;
  String feeAmount;
  String aadhaar;
  List<String> referenceIDs;

  StudentModel(
      {required this.registerID,
      required this.name,
      required this.emailID,
      required this.mobile,
      required this.batch,
      required this.course,
      required this.dateOfBirth,
      required this.category,
      required this.feePaid,
      required this.feeAmount,
      required this.referenceIDs,
      required this.aadhaar});

  factory StudentModel.fromJson(String source) {
    Map details = json.decode(source);
    List<dynamic> rawData = details['referenceIDs'];
    List<String> referenceIDs = rawData.map(
      (item) {
        return item as String;
      },
    ).toList();
    return StudentModel(
        course: details['course'],
        batch: details['batch'],
        category: details['category'],
        dateOfBirth: details['dateOfBirth'],
        emailID: details['emailID'],
        feeAmount: details['feeAmount'],
        mobile: details['mobile'],
        feePaid: details['feePaid'],
        name: details['name'],
        referenceIDs: referenceIDs,
        registerID: details['registerID'],
        aadhaar: details['aadhaar']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        registerID,
        name,
        emailID,
        mobile,
        batch,
        course,
        dateOfBirth,
        category,
        feePaid,
        feeAmount,
        referenceIDs,
        aadhaar
      ];
}
