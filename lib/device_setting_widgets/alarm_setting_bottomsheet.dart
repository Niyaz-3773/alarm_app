import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/alarm_datail_provider.dart';

@immutable
class AlarmSettingBottomsheet extends StatelessWidget {
  final String title;
  final String lable1;
  final String lable2;
  final String lable3;
  
  AlarmSettingBottomsheet(this.title,this.lable1,this.lable2,this.lable3);

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context,alarmDetail,child) => Padding(
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
                               alarmDetail.selectTune(lable1);
                            }else{
                                alarmDetail.selectStrength(lable1);
                            }
                          },
                          child: Text(
                            lable1,
                            style: TextStyle(
                              fontSize: 15,
                              color:  alarmDetail.selectedStrength==lable1 || alarmDetail.selectedTune==lable1
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
                               alarmDetail.selectTune(lable2);
                            }else{
                                alarmDetail.selectStrength(lable2);
                            }
                          },
                          child: Text(
                            lable2,
                            style: TextStyle(
                              fontSize: 15,
                              color:  alarmDetail.selectedStrength==lable2 || alarmDetail.selectedTune==lable2
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
                               alarmDetail.selectTune(lable3);
                            }else{
                                alarmDetail.selectStrength(lable3);
                            }
                          },
                          child: Text(
                            lable3,
                            style: TextStyle(
                              fontSize: 15,
                              color:  alarmDetail.selectedStrength==lable3 || alarmDetail.selectedTune==lable3
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
      ),
    );
  }
}