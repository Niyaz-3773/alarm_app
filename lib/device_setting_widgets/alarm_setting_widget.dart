import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/alarm_datail_provider.dart';
import 'alarm_setting_bottomsheet.dart';

class AlarmSetting extends StatelessWidget {
  const AlarmSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      decoration: BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1.0
        )
      ),

      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(
                'Alarm settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7)
                ),
                ),

              const SizedBox(height: 15,),
              _alarmSetting('Alarm tune',context),
              
              const SizedBox(height: 15,),
              _alarmSetting('Alarm strength',context),
            
              //Snooz
              const SizedBox(height: 15,),
              Text(
                'Snooz',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5)
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1.0
                  )
                ),      
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text(
                        '5 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.7)
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down)                   
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      );
  }

  _alarmSetting(String lable1, BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          lable1,
          style: TextStyle(
            fontSize: 17,
            color: Colors.black.withOpacity(0.5)
          ),
        ),
  
        const SizedBox(height: 5,),
        GestureDetector(
          onTap: () {
            if(lable1 == 'Alarm tune'){     
              _showAlarmTuneBottomSheet(context);
            }else if(lable1=='Alarm strength'){
              _showAlarmStrengthBottomSheet(context);
            }    
          },         
          child: Consumer<AlarmDetailProvider>(
            builder:(context, alarmDetail, child) =>  Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  color: Colors.black.withOpacity(0.1),
                  width: 1.0
                )
              ),
                
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(
                      lable1=='Alarm tune'
                      ? alarmDetail.selectedTune
                      :alarmDetail.selectedStrength,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7)
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down)                   
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAlarmTuneBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return AlarmSettingBottomsheet('Select tune','Chimes','Rooster','Sweet piano');      
      },
    );
  }

  void _showAlarmStrengthBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
       return AlarmSettingBottomsheet('Select strength','Low','Medium','Louder');      
      },
    );
  }
}