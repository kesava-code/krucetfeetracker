import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:krucetfeetracker/data/models/fee_model.dart';
import 'package:krucetfeetracker/data/repository/fee_repo.dart';

part 'fee_state.dart';

class FeeCubit extends Cubit<FeeState> {
  String? referenceID;
  FeeCubit() : super(FeeInitial());
  FeeRepo repo = FeeRepo();

  void getFeeDetails({required String referenceID}) async {
    FeeModel studentDetails =
        await repo.getFeeDetails(referenceID: referenceID);

    List<String> title = [
      "ReferenceID",
      "RegisterID",
      "Name",
      "Amount",
      "Remarks",
      "Date of Payment",
    ];
    List<String> content = [
      studentDetails.referenceID,
      studentDetails.registerID,
      studentDetails.name,
      studentDetails.amount,
      studentDetails.remarks,
      studentDetails.dateOfPayment,
    ];
    emit(FeeLoaded(title: title, content: content));
  }

  void validate({required String referenceID}) {
    emit(FeeLoading());
    if (referenceID.isEmpty) {
      emit(FeeError());
    } else {
      getFeeDetails(referenceID: referenceID);
    }
  }
}
