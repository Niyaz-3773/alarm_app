import 'package:alarm_app/device_setting_widgets/alarm_setting_widget.dart';
import 'package:flutter/material.dart';


class DeviceSetting extends StatefulWidget {
  const DeviceSetting({super.key});

  @override
  State<DeviceSetting> createState() => _DeviceSettingState();
}

class _DeviceSettingState extends State<DeviceSetting> {
 bool _setVactionTimeSwitch=false;
 bool _showMedNameSwitch=false;
 bool _autoFillSwitch=false;
 bool _addSorryTimeSwitch=false; 
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const  Text(
            'Device Setting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            ),
            centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 15,)
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.04, ),
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*0.04,),    
                Container(
                  decoration: BoxDecoration(
                    border: _setVactionTimeSwitch ?
                      Border(
                        top: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0),
                        right: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0),
                        left: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0), 
                      )                  
                      : Border.all(
                      color:  Colors.black.withOpacity(0.1),
                      width: 1.0
                    )
                  ),
                  child: SwitchListTile(
                    title: const Text(
                      'Set vaction time',
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                    value: _setVactionTimeSwitch,
                    onChanged: (bool value) {
                      setState(() => _setVactionTimeSwitch=value);
                    }
                  ),               
               ),
                
                if (_setVactionTimeSwitch) 
                  _switchOnContainer(),

              const SizedBox(height: 5,),
              _switches('Show meds name',_showMedNameSwitch),

              const SizedBox(height: 5,),
              _switches('Notify pharma to auto fill',_autoFillSwitch),


              const SizedBox(height: 5,),
              _switches('Add sorry time',_addSorryTimeSwitch),

              const SizedBox(height: 5,),
             
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 80,
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color:  Colors.black.withOpacity(0.1),
                    width: 1.0
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Text(
                      'Occupied cabinets',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.8)
                      ),
                    ),                 
                    Text(
                      '1, 2, 3, 4, 5',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6)
                      ),
                    ),               
                  ],
                )
              ),

              //Alarm Setting
                const SizedBox(height: 20,),
                 AlarmSetting(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  _switchOnContainer(){
    return Container(
      height: MediaQuery.of(context).size.height*0.26,
      padding: const EdgeInsets.all(13.0) ,
      decoration: BoxDecoration( 
        border: Border(
          bottom: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0),
          right: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0),
          left: BorderSide(color: Colors.blue.withOpacity(0.8), width: 1.0), 
        ), 
      ) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Start date & time',
            style: TextStyle(
              fontSize: 14
            ),
          ),
          const SizedBox(height: 3,),

          Container(
            height: MediaQuery.of(context).size.height*0.06,
            width: MediaQuery.of(context).size.width*0.1,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.0
              )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:const [
                Text(
                  'DD / MM / YYYY',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'HH : MM',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 6,),
          const Text(
            'End date & time',
            style: TextStyle(
              fontSize: 14
            ),
          ),
            
          const SizedBox(height: 5,),
          Container(
            height: MediaQuery.of(context).size.height*0.06,
            width: MediaQuery.of(context).size.width*0.1,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.0
              )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:const [
                Text(
                  'DD / MM / YYYY',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'HH : MM',
                  style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),                  
        ],
      ),
    );
  }


  _switches(String title,bool switchValue){
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color:  Colors.black.withOpacity(0.1),
          width: 1.0
        )
      ),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black.withOpacity(0.8)
          ),
        ),
        value:switchValue,
        onChanged: (bool value) {
          setState(() {
            if(title=='Show meds name'){
              _showMedNameSwitch=value;
            }else if(title=='Add sorry time'){
              _addSorryTimeSwitch=value;
            }else{
              _autoFillSwitch=value;
            }
          });
        }     
      ),
    );
  }
}