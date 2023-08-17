import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/api_service.dart';
import '../../../../data/employee_list_response.dart';
import '../employee_list_page.dart';


part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final APIService _apiService;
  EmployeeBloc(this._apiService) : super(EmployeeInitial())  {

    on<EmployeeEvent>((event, emit) async{
      emit(LoadingState());
    });
    on<EmployeeApiEvent>((event, emit) async{
      final response =  await _apiService.getEmployeeList();
      emit(LoadedState(response));
    });
  }
}
