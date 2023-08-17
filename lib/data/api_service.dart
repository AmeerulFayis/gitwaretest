import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'employee_list_response.dart';
import 'package:http/http.dart' as http;

class APIService{

  Future<List<dynamic>> getEmployeeList()async{
    dynamic url="http://www.mocky.io/v2/5d565297300000680030a986";
    try{
      var response=await http.Client().get(Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986"),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
      );
      return json.decode(response.body);
    }catch(e){
      log("Error in API$e");
      // if (e.todynamic().startsWith("SocketException") ||
      //     e.todynamic().startsWith("Failed host lookup")) {
      //   //no inter net case
      //  /* return EmployeeListResponse();*/
      // } else {
      //  /* return EmployeeListResponse();*/
      // }
      return [{"name":"aaa"}];
    }

  }


}