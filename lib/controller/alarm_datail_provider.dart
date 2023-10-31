import 'package:flutter/cupertino.dart';

import '../model/alarm_dateils_model.dart';

class AlarmDetailProvider extends ChangeNotifier{

  List<AlarmModel> alarmList = [];
  String cabinateNum='';
  String unit='ml';
  String medName='';
  DateTime time=DateTime.now();
  String dosage='00';

  void addAlarm(AlarmModel alarm) {
    alarmList.add(alarm);
    notifyListeners();
  }

  void setCabinateNum(String num){
    cabinateNum=num;
    notifyListeners();
  }

  void setUnit(String value){
    unit=value;
    notifyListeners();
  }

  void setMedName(String value){
    medName=value;
    notifyListeners();
  }

  void setDosage(String value){
    dosage=value;
    notifyListeners();
  }

  void setTime(DateTime value){
    time=value;
    notifyListeners();
  }
}