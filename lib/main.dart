import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitwaretest/data/api_service.dart';
import 'package:gitwaretest/ui/pages/employee_list/employee_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => APIService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EmployeeList(),
      ),
    );
  }
}

