part of 'fee_cubit.dart';

abstract class FeeState extends Equatable {
  const FeeState();

  @override
  List<Object> get props => [];
}

class FeeInitial extends FeeState {}

class FeeLoading extends FeeState {}

class FeeLoaded extends FeeState {
  final List<String> title;
 final List<String> content;
  const FeeLoaded({required this.title, required this.content});
}

class FeeError extends FeeState {
  final String error = "Please enter correct ReferenceID";
}
