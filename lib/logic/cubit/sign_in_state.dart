part of 'sign_in_cubit.dart';

class SignInState {
  bool registerIDError = false;
  bool passwordError = false;
  String registerID = "Your register ID is similar to y19cse279017";
  String password = "Password is a minimum of 8 characters.";
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInError extends SignInState {
  @override
  bool registerIDError;
  @override
  bool passwordError;
  @override
  String registerID = "";
  @override
  String password = "";

  SignInError({this.passwordError = false, this.registerIDError = false}) {
    password = passwordError
        ? "Password must be minimum of 8 characters."
        : "Password is a minimum of 8 characters.";
    registerID = registerIDError
        ? "Please enter a valid Register ID."
        : "Your register ID is similar to y19cse279001";
  }
}

class SignInLoaded extends SignInState {
  final String email;
  SignInLoaded({required this.email});
}
