import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitwaretest/data/api_service.dart';
import 'package:gitwaretest/ui/pages/employee_list/bloc/employee_bloc.dart';
import 'package:gitwaretest/utils/app_color.dart';
import 'package:gitwaretest/utils/app_text_view.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  late EmployeeBloc employeeBloc;
  @override
  void initState() {
    employeeBloc = EmployeeBloc(RepositoryProvider.of<APIService>(context));
   APIService().getEmployeeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => employeeBloc..add(EmployeeApiEvent()),
  child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kViolet,
        title: appTextView(name: "Employee List",color:AppColor.kWhite,size: 22),
      ),
      body: BlocConsumer<EmployeeBloc, EmployeeState>(
  listener: (context, state) {

  },
  builder: (context, state) {
if(state is LoadingState){
  return const Center(
    child: SizedBox(
        height: 45,
        width: 45,
        child: CircularProgressIndicator()),
  );

}else if(state is LoadedState){
  return ListView(
    shrinkWrap: true,
    primary: true,
    children: [
      ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: state.response.length,
        itemBuilder: (BuildContext context, int index) {
          return  ListTile(
            onTap: (){
              log(state.response[index].toString());
            },
            leading:  CircleAvatar(
              backgroundImage: NetworkImage(state.response[index]["profile_image"].toString()),
              radius: 25,
              backgroundColor: Colors.red,

            ),
            title: appTextView(name:state.response[index]["name"].toString(),fontWeight: FontWeight.bold ),
            subtitle: appTextView(name: state.response[index]["company"]!=null?state.response[index]["company"]["name"].toString():"No Company",color: AppColor.kGrey),
          );

        }, separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10,);
      },)
    ],
  );

}else{
  return Container();
}

  },
),
    ),
);
  }
}
