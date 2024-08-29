import 'package:bloc/bloc.dart';
import 'package:krucetfeetracker/data/repository/signin_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  bool registerIDError = false;
  bool passwordError = false;
  void verifyDetails(
      {required String registerID,
      required String password}) {
    if (registerID.length != 12) {
      registerIDError = true;
    } else {
      registerIDError = false;
    }
    
    if (password.length < 8) {
      passwordError = true;
    } else {
      passwordError = false;
    }
    if (registerIDError  || passwordError) {
      emit(SignInError(
          passwordError: passwordError,
          registerIDError: registerIDError));
    } else {
      getEmail(registerID: registerID, password: password);
    }
  }

  void getEmail(
      {required String registerID,
      required String password}) async {
    final SignInRepo repo = SignInRepo();
    emit(SignInLoading());
    final email = await repo.getEmail(
        registerID: registerID, password: password);
    emit(SignInLoaded(email: email.email));
  }
}
