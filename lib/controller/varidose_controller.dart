import 'package:get/get.dart';

import '../model/varidose_model.dart';

class VaridoseController extends GetxController{
  List<VaridoseModel> varidoseList=[
    VaridoseModel(varidoseName: 'Varidose', serialNum: 'XX77779999ZZ'),
    VaridoseModel(varidoseName: 'Varidose', serialNum: 'MN88993374OZ'),
    VaridoseModel(varidoseName: 'Varidose', serialNum: 'RS90972170UA'),
  ].obs;
    Rx<int> currentIndex=(-1).obs;

  void removeVaridoseAt(int index){
    varidoseList.removeAt(index);
    update();
  }
  
  void setIndex(int index){
    currentIndex.value=index;
    update();
  }
}