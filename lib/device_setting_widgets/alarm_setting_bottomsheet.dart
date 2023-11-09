import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/alarm_setting_controller.dart';

class AlarmSettingBottomsheet extends StatelessWidget {
  final String title;
  final String lable1;
  final String lable2;
  final String lable3;
  
  AlarmSettingBottomsheet(this.title,this.lable1,this.lable2,this.lable3, {super.key});

  AlarmSettingController settingController=Get.put(AlarmSettingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Padding(
        padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.45,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.arrow_back_ios),         
                ),
                Center(
                  child: Container(
                   height:MediaQuery.of(context).size.height*0.35,
                    
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style:const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        
                       const SizedBox(height: 20,),
                        TextButton(
                          onPressed: () {
                            if(title=='Select tune'){
                               settingController.selectTune(lable1);
                            }else{
                                settingController.selectStrength(lable1);
                            }
                          },
                          child: Text(
                            lable1,
                            style: TextStyle(
                              fontSize: 15,
                              color:  settingController.selectedStrength.value == lable1 || settingController.selectedTune.value == lable1
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
    
                      const SizedBox(height: 8,),
                        
                       const SizedBox(
                          width: 70,
                          child:  Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                        ),
    
                        const SizedBox(height: 8,),
                        TextButton(
                          onPressed: () {
                            if(title=='Select tune'){
                               settingController.selectTune(lable2);
                            }else{
                                settingController.selectStrength(lable2);
                            }
                          },
                          child: Text(
                            lable2,
                            style: TextStyle(
                              fontSize: 15,
                              color:  settingController.selectedStrength.value == lable2|| settingController.selectedTune.value==lable2
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
    
                       const SizedBox(height: 8,),
                        
                        const SizedBox(
                          width: 70,
                          child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                        ),
                        const SizedBox(height: 8,),
                        TextButton(
                          onPressed: () {
                            if(title=='Select tune'){
                               settingController.selectTune(lable3);
                            }else{
                                settingController.selectStrength(lable3);
                            }
                          },
                          child: Text(
                            lable3,
                            style: TextStyle(
                              fontSize: 15,
                              color:  settingController.selectedStrength.value == lable3|| settingController.selectedTune.value==lable3
                              ? Colors.black
                              : Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
    
                      ],
                    ),
                  ),
                )
              ],
            ) ,
        ),
      )
    );
  }
}