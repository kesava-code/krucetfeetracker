part of 'student_cubit.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  List<String> title;
  List<String> content;
  StudentLoaded({required this.title, required this.content});
}

class StudentError extends StudentState {
  final String error = "Please enter correct RegisterID";
}
