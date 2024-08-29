import 'package:bloc/bloc.dart';
import 'package:krucetfeetracker/data/repository/otp_repo.dart';

part 'verifyotp_state.dart';

class VerifyotpCubit extends Cubit<VerifyotpState> {
  VerifyotpCubit() : super(VerifyotpInitial());
  OTPRepo repo = OTPRepo();
  void verifyotp({
    required String otpctrl1,
    required String otpctrl2,
    required String otpctrl3,
    required String otpctrl4,
    required String email,
  }) async {
    if (otpctrl1.length == 1 &&
        otpctrl2.length == 1 &&
        otpctrl3.length == 1 &&
        otpctrl4.length == 1) {
      emit(VerifyotpLoading());
      String otp = otpctrl1 + otpctrl2 + otpctrl3 + otpctrl4;
      final otpModel = await repo.getOTP(OTP: otp, email: email);
      if (otpModel.status == "success") {
        emit(VerifyotpSuccess());
      } else {
        emit(VerifyotpError());
      }
    } else {
      emit(VerifyotpError());
    }
  }
}
