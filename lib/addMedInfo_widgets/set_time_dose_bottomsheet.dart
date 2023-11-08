import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/alarm_datail_provider.dart';

class SetTimedDoseBottomsheet extends StatelessWidget {
  SetTimedDoseBottomsheet({super.key});

  final TextEditingController _doseController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context, alarmDetail, child) => SizedBox(
        height: MediaQuery.of(context).size.height*0.55,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: const Icon(Icons.arrow_back_ios,size: 17)
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        child:const Text(
                          'Done',
                          style: TextStyle(
                            color:Color.fromARGB(255, 97, 232, 234),
                            fontSize: 16
                            ),
                          )
                      )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8,),
      
            //set time
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width:  300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Set time',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: CupertinoDatePicker(
                      initialDateTime: alarmDetail.time,
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged: (time){
                        alarmDetail.setTime(time);
                      }, 
                    ),
                  ),
                  
                ],
              ),
            ),
              //set dosage
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                      const Text(
                        'Set dosage',
                        style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //set dose
                          SizedBox(
                            height: 44, 
                            width: 170, 
                            child: TextFormField(
                              controller: _doseController,
                              style:const TextStyle(color: Colors.black,fontSize: 16),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                hintText: "Enter dose",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0, 
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                  ),
                                ),
                                onChanged: (value) {
                                  alarmDetail.setDosage(value);
                                },
                              ),
                            ),
                          const SizedBox(width: 15,),
    
                          //set unit
                          Container(
                            height: 44,
                            width: 100,
                            padding: const EdgeInsets.only(left: 50),
                            decoration: BoxDecoration(
                              borderRadius:const BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0
                              )
                            ),
                            child: DropdownButton<String>(
                              value:alarmDetail.unit,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 17,color: Colors.black),
                              style: const TextStyle(color: Colors.black),
                              underline: const SizedBox(),
                              onChanged: (newUnit){
                                alarmDetail.setUnit(newUnit!);
                              },
                              items: const[
                                DropdownMenuItem<String>(
                                  value:'ml' ,
                                  child: Text('ml'),
                                ),
                                DropdownMenuItem<String>(
                                  value:'mcg' ,
                                  child: Text('mcg'),
                                ),
                                DropdownMenuItem<String>(
                                  value:'cc' ,
                                  child: Text('cc'),
                                )
                              ],                          
                            ),  
                          )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}