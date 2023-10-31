import 'package:flutter/material.dart';

class DeviceSetting extends StatefulWidget {
  const DeviceSetting({super.key});

  @override
  State<DeviceSetting> createState() => _DeviceSettingState();
}

class _DeviceSettingState extends State<DeviceSetting> {
 bool _switchValue=false;

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Device Setting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
              ),
          ),
            leading: IconButton(
              onPressed: (){Navigator.pop(context);},
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 15,)
              ),
        ),
    
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height:MediaQuery.of(context).size.height*0.04,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      border: _switchValue ?
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
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() => _switchValue=value);
                        }),
                        
                  ),
                ),
                 if (_switchValue) 
                    _switchOnContainer(),

              const SizedBox(height: 5,),
              _switches('Show meds name'),

              const SizedBox(height: 5,),
              _switches('Notify pharma to auto fill'),


              const SizedBox(height: 5,),
              _switches('Add sorry time'),

              const SizedBox(height: 5,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),

                  child: Container(
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Occupied cabinets',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.8)
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '1, 2, 3, 4, 5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.6)
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),

              //Alarm Setting
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
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
                          _alarmSetting('Alarm tune', 'Rooster'),
                          
                          const SizedBox(height: 15,),
                          _alarmSetting('Alarm strength', 'Louder'),
                        
                         const SizedBox(height: 15,),
                          _alarmSetting('Snooz','5min'),
                      ],
                    ),
                  ),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _switchOnContainer(){
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      height: 150,
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
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: const Text(
              'Start date & time',
              style: TextStyle(
                fontSize: 14
              ),
              ),
            ),
            const SizedBox(height: 3,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1.0
                  )
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ),
              ),
            ),

            const SizedBox(height: 6,),
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              'End date & time',
              style: TextStyle(
                fontSize: 14
              ),
              ),
            ),

            const SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1.0
                  )
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
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
                ),
              ),
            ),        
        ],
      ),
    ),
  );
  }


  _switches(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color:  Colors.black.withOpacity(0.1),
            width: 1.0
          )
        ),
        child: SwitchListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black.withOpacity(0.8)
              ),
            ),
            value: false,
            onChanged: null     
      ),
    ),
    );
  }

  _alarmSetting(String lable1,String lable2){
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
          
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius:const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 1.0
              )
            ),
    
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      lable2,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black.withOpacity(0.7)
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down, 
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
        return _bottomSheetContent('Select tune','Chimes','Rooster','Sweet piano');      
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
       return _bottomSheetContent('Select strength','Low','Medium','Louder');      
      },
    );
  }

    _bottomSheetContent(String lable1,String lable2,String lable3,String lable4){
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: SizedBox(
        height: 250,
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
                  height: 200,
                  width: 150,
                  
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        lable1,
                        style:const TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      
                     const SizedBox(height: 20,),
                      Text(
                        lable2,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w500
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
                      Text(
                        lable3,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w500
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
                      Text(
                        lable4,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w500
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ) ,
      ),
    );
  } 
}