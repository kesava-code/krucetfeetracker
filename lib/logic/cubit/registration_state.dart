part of 'registration_cubit.dart';

class RegistrationState {
  bool registerIDError = false;
  bool aadhaarError = false;
  bool passwordError = false;
  String registerID = "Your register ID is similar to y19cse279017";
  String aadhaar = "";
  String password = "Password is a minimum of 8 characters.";
}

class RegistrationInitial extends RegistrationState {
}

class RegistrationLoading extends RegistrationState{}

class RegistrationError extends RegistrationState {
  @override
  bool registerIDError;
  @override
  bool aadhaarError;
  @override
  bool passwordError;
  @override
  String registerID = "";
  @override
  String aadhaar = "";
  @override
  String password = "";
  RegistrationError(
      {this.aadhaarError = false,
      this.passwordError = false,
      this.registerIDError = false}) {
    aadhaar = aadhaarError ? "Please enter a valid Aadhaar number." : "";
    password = passwordError
        ? "Password must be minimum of 8 characters."
        : "Password is a minimum of 8 characters.";
    registerID = registerIDError
        ? "Please enter a valid Register ID."
        : "Your register ID is similar to y19cse279017";
  }
}

class RegistrationLoaded extends RegistrationState {
  final String email;
  RegistrationLoaded({required this.email});
}
