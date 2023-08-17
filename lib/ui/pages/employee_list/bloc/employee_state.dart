part of 'employee_bloc.dart';


abstract class EmployeeState extends Equatable{}

class EmployeeInitial extends EmployeeState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends EmployeeState {
  @override
  List<Object?> get props => [];
}
class LoadedState extends EmployeeState {
  List<dynamic> response;
  LoadedState(this.response);
  @override
  List<Object?> get props => [response];
}