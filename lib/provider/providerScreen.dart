import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:whetherapp/modal/whetherModal.dart';
class HomeProvider extends ChangeNotifier {

  String lan = "21.1702";
  String lon = "72.8311";

void change(String glan,String glon){
  lan = glan;
  lon = glon;
  notifyListeners();
}



  List data =[];

  Future<WhetherModal> apiCalling(String clan,String clon) async{
    String link =
        "https://api.openweathermap.org/data/2.5/weather?lat=$clan&lon=$clon&appid=9628b95a2235abb2f18055013ade5de8";
    var jsonString =await http.get(Uri.parse(link));
    var json= jsonDecode(jsonString.body);

    return WhetherModal.fromJson(json);
  }
}
