import 'package:alarm_app/controller/alarm_datail_provider.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../model/alarm_dateils_model.dart';
@immutable
class RescheduleAlarmBottomsheet extends StatelessWidget {
  final int currentIndex;
  const RescheduleAlarmBottomsheet(this.currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder: (context,alarmDetail,child) {
      AlarmModel item = alarmDetail.alarmList[currentIndex];
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: (){
                    Navigator.pop(context);
                    }, 
                    icon: const Icon(Icons.arrow_back_ios,size: 17)
                  ),
                  TextButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color:Color.fromARGB(255, 97, 232, 234),
                        fontSize: 16
                      ),
                    ),
                  ),
                ],
              ),
    
              const Text(
                'Reschedule alarm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Reschedule Hour
                  NumberPicker(
                    minValue: 0,
                    maxValue: 12,
                    value: item.rescheduleHour,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      alarmDetail.setRescheduleHour(currentIndex, value);
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                    selectedTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(width: 40,),
                  //Reschedule Minutes
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: item.rescheduleMin,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      alarmDetail.setRescheduleMin(currentIndex, value);
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                    selectedTextStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                          ),
                          bottom: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
      }
    );
  }
}