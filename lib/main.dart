
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/alarm_datail_provider.dart';
import 'home_pages/buy_varidose_page.dart';


void main(){
  runApp(const MyApp());
}


class MyApp extends  StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AlarmDetailProvider())
      ],
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:VaridoseHomePage()
      ),
    );
  }
}