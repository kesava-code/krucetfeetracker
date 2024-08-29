import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:krucetfeetracker/data/models/Student_model.dart';
import 'package:krucetfeetracker/data/repository/student_repo.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  String? registerID;
  StudentCubit() : super(StudentInitial());
  StudentRepo repo = StudentRepo();

  void getStudentDetails({required String registerID}) async {
    StudentModel studentDetails =
        await repo.getStudentDetails(registerID: registerID);
    String status = "Unpaid";

    int due =
        int.parse(studentDetails.feeAmount) - int.parse(studentDetails.feePaid);
    String feeDue = due.toString();
    if (studentDetails.feeAmount == studentDetails.feePaid) {
      status = "Paid";
    }

    List<String> title = [
      "Status",
      "RegisterID",
      "Name",
      "Email - ID",
      "Mobile",
      "Aadhaar Number",
      "Batch",
      "Course",
      "Date of Birth",
      "Category",
      "Fee Paid",
      "Fee Due",
      "Payment Details"
    ];
    List<String> content = [
      status,
      studentDetails.registerID,
      studentDetails.name,
      studentDetails.emailID,
      studentDetails.mobile,
      studentDetails.aadhaar,
      studentDetails.batch,
      studentDetails.course,
      studentDetails.dateOfBirth,
      studentDetails.category,
      studentDetails.feePaid,
      feeDue,
      studentDetails.referenceIDs.toString()
    ];
    emit(StudentLoaded(title: title, content: content));
  }

  void validate({required String registerID}) {
    emit(StudentLoading());
    if (registerID.length != 12) {
      emit(StudentError());
    } else {
      getStudentDetails(registerID: registerID);
    }
  }
}
