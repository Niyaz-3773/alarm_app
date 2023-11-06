import 'package:alarm_app/model/alarm_dateils_model.dart';
import 'package:alarm_app/screens/varidose_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../controller/alarm_datail_provider.dart';


class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddMedState();
}

class _AddMedState extends State<AddMed> {
  String _selectedButton='daily';
  final TextEditingController _madicineNameController=TextEditingController();
  int _days=0;
  List specificDaysList=[];
  

  void _decrementIntervalDays(){
    if(_days>0){
      setState(() {
        _days--;
      });
    }
  }

  void _incrementIntervalDays(){
    setState(() {
      _days++;
    });
  }

  void _handleRadioButton(String? value){
    setState(() {
      if(value !=null){
        _selectedButton=value;
      }
    });
  }

  void _manageSpecificDays(value){
    setState(() {
      if(specificDaysList.contains(value)){
        specificDaysList.remove(value);
      }else{
        specificDaysList.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context,alarmDetail,child)=> Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Add Medicine Info',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
            onPressed: (){
              AlarmModel alarm=  AlarmModel(
                medName:alarmDetail.medName,
                dosage:alarmDetail.dosage,
                unit:alarmDetail.unit,
                time : alarmDetail.time,
              );
              alarmDetail.addAlarm(alarm);
               Navigator.push(context,
                MaterialPageRoute(builder: (context) =>const VaridosePage())  
              );
            }, 
            child:const Text(
              'Next',
              style: TextStyle(
                color:Color.fromARGB(255, 97, 232, 234),
                fontSize: 16
                ),
              )
            )
          ],
          leading:IconButton(
            onPressed: (){
              alarmDetail.alarmList.clear();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 16,)
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.07 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const SizedBox(height: 10,),
                  const Text(
                    'Madicine name',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey  
                    ),
                    ), 
                  const SizedBox(height: 4,),
    
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    height: 47,
                    width: MediaQuery.of(context).size.width*0.9, 
                    child: TextFormField(
                      controller: _madicineNameController,
                      style:const TextStyle(color: Colors.black,fontSize: 16),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Enter name",
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
                          alarmDetail.setMedName(value); 
                        }
                      ),
                    ),
      
                  const SizedBox(height: 20,),
                  const Text(
                    'Frequency',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),
                  ),
                 const SizedBox(height: 8,),
                  customRadio('daily', 'Daily'),
                  const SizedBox(height: 10,),
                  customRadio('specificDays', 'Specific Days'),
                  const SizedBox(height: 10,),
                  customRadio('interval', 'Interval'),
                  const SizedBox(height: 10,),
                  customRadio('asNeeded', 'As needed'),
    
                  if(_selectedButton=='specificDays')
                    _selectedDaysButton(),
    
                  if(_selectedButton=='interval')
                    _selectedIntervalButton(),
    
                  if(_selectedButton=='asNeeded')
                    _selectedAsNeededButton(),
                  
                  const SizedBox(height: 20,),
                  if(_selectedButton != 'asNeeded')
                   _setDateAndTimeContainer(alarmDetail),          
                ],
            ) ,
          ),
        ),
      ),
    );   
  }

  Widget customRadio(String value, String title) {
    return Row(
        children: [
          Radio<String>(
            value: value,
            groupValue: _selectedButton,
            onChanged: _handleRadioButton,
          ),
          const SizedBox(width: 4,),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
               color : _selectedButton==value ? Colors.black : Colors.black.withOpacity(0.5),
               fontWeight: FontWeight.w500
            ),
            ),
        ],
      );
  }

  _setDateAndTimeContainer(AlarmDetailProvider alarmDetail){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Set time & dose',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey
          ),
        ),
        const SizedBox(height: 4,),
        InkWell(
          onTap: () {  
            _setDateAndTime(context,alarmDetail);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 11),
            height: 44,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1.0
              )
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.jm().format(alarmDetail.time),
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      '${alarmDetail.dosage} ${alarmDetail.unit}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectedDaysButton(){
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selected days',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 4,),
          SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width*0.9,
              child:Row(
              children: [
                _customCircle('S',0),
                const SizedBox(width: 4,),
                _customCircle('M',1),
                const SizedBox(width: 4,),
                _customCircle('T',2),
                const SizedBox(width: 4,),
                _customCircle('W',3),
                const SizedBox(width: 4,),
                _customCircle('T',4),
                const SizedBox(width: 4,),
                _customCircle('F',5),
                const SizedBox(width: 4,),
                _customCircle('S',6),
                const SizedBox(width: 4,),                
              ],
            )    
          ),
        ],
      ),
    );
  }

 _customCircle(String day, int value){
    return InkWell(
        onTap: () {
          _manageSpecificDays(value);
        },
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1.0
              ),
              color:  specificDaysList.contains(value) 
                    ?  const Color.fromARGB(255, 97, 232, 234) 
                    : Colors.white,
          ),
          child: Text(
            day,
            style:TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color:  specificDaysList.contains(value) ?Colors.black : Colors.grey,
          ),
          ),
          
        ),
    );
  }

  _selectedIntervalButton(){
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'In every',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 4,),
          SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width*0.9,
              child:Row(
              children: [
                _intervalIncreAndDecreButton(Icons.remove),
                const SizedBox(width: 8,),
                Container(
                  height: 44,
                  width:MediaQuery.of(context).size.width*0.6,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1.0
                    )
                  ),
                  child: Center(
                    child: Text(
                      '$_days days',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),  
                 ),
                 const SizedBox(width: 8,),
                 _intervalIncreAndDecreButton(Icons.add),                                 
              ],
            )    
          ),
        ],
      ),
    );
  }

  _intervalIncreAndDecreButton(IconData iconData){
    return Container(
      alignment: Alignment.center,
      height: 44,
      width: 44,
      
      decoration: BoxDecoration(
        color:const Color.fromARGB(255, 97, 232, 234).withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color:const Color.fromARGB(255, 97, 232, 234),
          width: 1.0,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if(iconData == Icons.remove){
              _decrementIntervalDays();
          }else{
              _incrementIntervalDays();
          }
        },
        child: Container(
          height: 20,
          width: 20,  
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color:Color.fromARGB(255, 97, 232, 234),
          ),
          child: Center(
                  child:Icon(iconData,color: Colors.white, size: 13,),
              ),
          ),
      ),
    );
  }

  _selectedAsNeededButton(){
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child:  SizedBox(
        height: 40,
        child: Text(
          'No remainder needed. To add reminder choose another frequency optioner',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 68, 67, 67),
          ),
        ),
      ),
    );
  }

  void _setDateAndTime(BuildContext context,alarmDetail) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return const SetTimeAndDose();  
      },
    );
  }

}




class SetTimeAndDose extends StatefulWidget {
  const SetTimeAndDose({super.key});

  @override
  State<SetTimeAndDose> createState() => _SetTimeAndDoseState();
}

class _SetTimeAndDoseState extends State<SetTimeAndDose> {
  final TextEditingController _doseController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmDetailProvider>(
      builder:(context, alarmDetail, child) => SizedBox(
        height: MediaQuery.of(context).size.height*0.6,
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




