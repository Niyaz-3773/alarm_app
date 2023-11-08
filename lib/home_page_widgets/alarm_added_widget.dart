import 'package:alarm_app/controller/alarm_datail_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/alarm_dateils_model.dart';
import 'edit_alarm_popup_widget.dart';

class AlarmAddedWidget extends StatelessWidget {
  const AlarmAddedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context,alarmDetail,child) => Expanded(
        child: ListView.builder(
          itemCount: alarmDetail.alarmList.length,
          itemBuilder: (context, index) {
          AlarmModel item = alarmDetail.alarmList[index]; 
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                padding: const EdgeInsets.fromLTRB(15,10,15,10),
                decoration: BoxDecoration(           
                    borderRadius: BorderRadius.circular(20), 
                    border: Border.all(
                      color:item.medTaken
                      ? const Color.fromARGB(255, 97, 232, 234) 
                      : const Color.fromARGB(255, 235, 167, 66).withOpacity(0.3),
                      width: 2.0, 
                    ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                      
                        if(item.medTaken)
                          medTakenTime(item, context)
                        else if(item.rescheduleHour>0)
                          medRescheduleTime(item, context)
                        else
                          medUntakenTime(item, context),

                        TextButton(
                          onPressed:() {
                            showDialog(
                              context: context, 
                              builder: (context) => EditAlarmmPopupWidget(index),
                            );
                          },
                          child: Text(
                           'edit',
                            style: TextStyle(
                              color: Colors.blue.withOpacity(0.5),
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ),                                                  
                      ],
                    ),
                    const SizedBox(height:10.0,),                           
                    Text(
                      item.medName,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.7)
                      ),
                    ),                           
                    const SizedBox(height:10.0,),
                    Text(
                      item.dosage=='00' ? 'No dose added'
                      : 'Take ${item.dosage}${item.unit} from cabinet ${item.cabinetID}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.withOpacity(0.9)                                   
                      ), 
                    ),
                  ],
                ),
              ),
            );
          },
        ),                   
      ),
    );
  }

  medTakenTime(AlarmModel item,BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
      color: Color.fromARGB(255, 97, 232, 234)  ,
        borderRadius: BorderRadius.all(Radius.circular(20)),        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateFormat.jm().format(item.time),
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.check_box,size: 20,)
        ],
      ),                          
    );
  }

  medUntakenTime(AlarmModel item,BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 232, 181, 31).withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(20)),        
      ),
      child: Center(
        child: Text(
          DateFormat.jm().format(item.time),
          style: TextStyle(
            fontSize: 17,
            color: Colors.black.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  medRescheduleTime(AlarmModel item,BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration:  BoxDecoration(
      color:const Color.fromARGB(255, 232, 181, 31).withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(20)),        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateFormat.jm().format(item.time),
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        Text(
            'Snooz until ${item.rescheduleHour.toString().padLeft(2, "0")}:${item.rescheduleMin.toString().padLeft(2, "0")}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),                          
    );
  }
}