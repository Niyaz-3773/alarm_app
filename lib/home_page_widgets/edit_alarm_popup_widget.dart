import 'package:alarm_app/controller/alarm_datail_provider.dart';
import 'package:alarm_app/home_page_widgets/reschedule_alarm_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/alarm_dateils_model.dart';

@immutable
class EditAlarmmPopupWidget extends StatelessWidget {
  final int currentIndex;
 const EditAlarmmPopupWidget(this.currentIndex, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context, alarmDetail, child) { 
        AlarmModel item = alarmDetail.alarmList[currentIndex];
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.65,
            height: MediaQuery.of(context).size.width*0.65,
            color: Colors.white,
      
            child: Padding(
              padding: const EdgeInsets.all(8),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const  SizedBox(height: 8,),
                  const Icon(
                    Icons.notifications,
                    size: 70,
                    color: Color.fromARGB(255, 225, 167, 80),
                  ),
                  const SizedBox(height: 15,),
        
                  Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.2,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 230, 189, 68).withOpacity(0.5),
                        borderRadius:const BorderRadius.all(Radius.circular(20)),        
                        ),
                        child: Center(
                          child: Text(
                            DateFormat.jm().format(item.time),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 15,),                
                      Text(
                          item.medName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.7),
                            decoration: TextDecoration.none
                          ),
                        ),
                        
                      const SizedBox(height: 8.0,),
                      Text(
                        item.dosage=='00' ? 'No dose added'
                        : 'Take ${item.dosage}${item.unit} from cabinet ${item.cabinetID}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.withOpacity(0.9),
                          decoration: TextDecoration.none
                          
                        ),                       
                      ),
                      const SizedBox(height: 14,),                       
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                context: context,
                                shape:const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (context) {
                                  return RescheduleAlarmBottomsheet(currentIndex);  
                                },
                              );   
                            },
                            child:const Text(
                              'Reschedule',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none
                              ),
                            ),
                          ),
      
                          GestureDetector(
                            onTap: () {
                              alarmDetail.toggleMedTaken(currentIndex);
                              Navigator.pop(context);
                            },
                            child: Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width*0.25,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.2),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.9),
                                width: 1.0
                              )     
                              ),
                              child: Center(
                                child: Text(
                                 item.medTaken ? 'Untaken' :'Taken',
                                  style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                ),
                              ),
                              ),
                            ),
                          ),
                      ],
                    )
                ],
              )
            ),
          ),
        );         
      }
    ); 
  }
}