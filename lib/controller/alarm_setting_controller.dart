
import 'package:get/get.dart';

class AlarmSettingController extends GetxController{
  Rx<String> selectedStrength='Medium'.obs;
  Rx<String> selectedTune='Rooster'.obs;


   void selectStrength(String value){
    selectedStrength.value=value;
    update();
  }

  void selectTune(String value){
    selectedTune.value=value;
    update();
  }
}