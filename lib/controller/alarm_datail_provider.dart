import 'package:flutter/cupertino.dart';

import '../model/alarm_dateils_model.dart';

class AlarmDetailProvider extends ChangeNotifier{

  List<AlarmModel> alarmList = [];
  String unit='ml';
  String medName='';
  DateTime time=DateTime.now();
  String dosage='00';
  String selectedStrength='Medium';
  String selectedTune='Rooster';

  void addAlarm(AlarmModel alarm) {
    alarmList.add(alarm);
    notifyListeners();
  }

  void setCabinateID(int index,int id){
    alarmList[index].cabinetID=id;
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

  void selectStrength(String value){
    selectedStrength=value;
    notifyListeners();
  }

  void selectTune(String value){
    selectedTune=value;
    notifyListeners();
  }

  void toggleMedTaken(int index){
    alarmList[index].medTaken=!alarmList[index].medTaken;
    notifyListeners();
  }

  void setRescheduleHour(int index,int value){
    alarmList[index].rescheduleHour=value;
    notifyListeners();
  }

  void setRescheduleMin(int index,int value){
    alarmList[index].rescheduleMin=value;
    notifyListeners();
  }
}