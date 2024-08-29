import 'package:bloc/bloc.dart';
import 'package:krucetfeetracker/data/repository/registration_repo.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  bool registerIDError = false;
  bool aadhaarError = false;
  bool passwordError = false;
  void verifyDetails(
      {required String registerID,
      required String aadhaar,
      required String password}) {
    if (registerID.length != 12) {
      registerIDError = true;
    } else {
      registerIDError = false;
    }
    if (aadhaar.length != 12) {
      aadhaarError = true;
    } else {
      aadhaarError = false;
    }
    if (password.length < 8) {
      passwordError = true;
    } else {
      passwordError = false;
    }
    if (registerIDError || aadhaarError || passwordError) {
      emit(RegistrationError(
          aadhaarError: aadhaarError,
          passwordError: passwordError,
          registerIDError: registerIDError));
    } else {
      getEmail(registerID: registerID, aadhaar: aadhaar, password: password);
    }
  }

  void getEmail(
      {required String registerID,
      required String aadhaar,
      required String password}) async {
    final RegistrationRepo repo = RegistrationRepo();
    emit(RegistrationLoading());
    final email = await repo.getEmail(
        registerID: registerID, aadhaar: aadhaar, password: password);
    emit(RegistrationLoaded(email: email.email));
  }
}
