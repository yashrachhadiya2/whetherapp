
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whetherapp/provider/providerScreen.dart';
import 'package:whetherapp/view/homeScreen.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>HomeScreen(),
        },
      ),
    ),
  );
}