import 'dart:convert';

import 'package:equatable/equatable.dart';

class FeeModel extends Equatable {
  final String registerID;
  final String name;
  final String amount;
  final String remarks;
  final String dateOfPayment;
  final String referenceID;
  

  const FeeModel(
    {required this.referenceID,
      required this.registerID,
      required this.name,
      required this.amount,
      required this.remarks,
      required this.dateOfPayment,
    });

  factory FeeModel.fromJson(String source) {
     Map details = json.decode(source);
    return FeeModel(
        name: details['name'],
        referenceID: details['referenceID'],
        registerID: details['registerID'],
        remarks: details['remarks'],
        dateOfPayment: details['dateOfPayment'],
        amount: details['amount']);
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        registerID,
        name,
        referenceID,
        amount,
        remarks,
        dateOfPayment
      ];
}
