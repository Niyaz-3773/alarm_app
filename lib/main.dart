import 'package:alarm_app/home_pages/paired_varidose.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/alarm_datail_provider.dart';


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
        home:PairedVaridose()  //BuyVaridosePage()
      ),
    );
  }
}