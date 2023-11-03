import 'package:alarm_app/model/alarm_dateils_model.dart';
import 'package:alarm_app/screens/add_med_info.dart';
import 'package:alarm_app/screens/device_setting.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../controller/alarm_datail_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AlarmDetailProvider>(
        builder:(context,alarmDetail,child) =>Scaffold(
          body: Column(
            children: [             
              //adherence score
              Container(
                height: MediaQuery.of(context).size.height*0.2,
                  color:const  Color.fromARGB(255, 97, 232, 234)  
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: alarmDetail.alarmList.length,
                  itemBuilder: (context, index) {
                    AlarmModel item = alarmDetail.alarmList[index]; // Get the data for this item
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.17,
                        decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(20), // Adjust the value to control the curvature
                            border: Border.all(
                              color:const Color.fromARGB(255, 235, 167, 66).withOpacity(0.3), // Border color
                              width: 2.0, // Border width
                            ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.05,
                                    width: MediaQuery.of(context).size.width * 0.2,
                                      decoration: BoxDecoration(
                                        color:const Color.fromARGB(255, 232, 181, 31).withOpacity(0.5),
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
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:10.0),
                                  child: Container(        
                                    color: Colors.white,
                                    width: 30,
                                    height: 30,
                                    child: Text(
                                      'edit',
                                      style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5),
                                        fontWeight: FontWeight.bold
                                        ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:const EdgeInsets.fromLTRB(15, 0, 10,0 ),
                              child: Container(
                                color: Colors.white,
                                height: 20,
                                width: 100,
                              
                                  child: Text(
                                    item.medName,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black.withOpacity(0.7)
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding:const EdgeInsets.fromLTRB(15, 10, 10, 0),
                              child: Container(
                                color: Colors.white,
                                height: 15,
                                width: 200,
                                child: Text(
                                 item.dosage=='00' ? 'No dose added'
                                  : 'Take ${item.dosage}${item.unit} from cabinet ${alarmDetail.cabinateNum}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.withOpacity(0.9)                                   
                                  ), 
                                ),
                              ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      
      
              //add med button
              Container(
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    _showPopupContainer( context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
                      Icon(Icons.add_box,
                          color:Color.fromARGB(255, 97, 232, 234)),
                        SizedBox(width: 3,),
                        Text(
                          'Add med',
                          style: TextStyle(
                            color: Color.fromARGB(255, 97, 232, 234),
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                          )
                    ],
                  ),
                ),
              ),
              )
            ],
          ),
        //bottom Nav Bar
        bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if(index==3){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const DeviceSetting())
            );
          }else if(index==2){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const AddMed())
            );
          }
        },
        selectedIndex: 0,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month_sharp),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'history',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_box),
            icon: Icon(Icons.add_box_outlined),
            label: 'add',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'more',
          ),
        ],
          ),          
          ),
      )

   );
 }

  void _showPopupContainer(BuildContext context) {
    showDialog(
      context: context,     
      builder: (BuildContext context) {
        return Center(
        child: Container(
          width: 250,
          height: 250,
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
                        child: Text('8:00am',
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
    
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 90,
                    
                        child: Text(
                          'Paraciane',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.7),
                            decoration: TextDecoration.none
                          ),
                        ),
                    ),
    
                    const SizedBox(height: 8.0,),
    
                      Container(
                      alignment: Alignment.center,
                        color: Colors.white,
                        height: 15,
                        width: 200,
                        child: Text(
                          'Teake 5.5ml from cabinet 2',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.9),
                            decoration: TextDecoration.none
                            
                          ),
                          
                        ),
                      ),
                      const SizedBox(height: 10,),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Reschedule',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none
                            ),
                          ),
    
                          Container(
                          height: MediaQuery.of(context).size.height*0.04,
                          width: MediaQuery.of(context).size.width*0.2,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.2),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.9),
                              width: 1.0
                            )     
                            ),
                            child: Center(
                              child: Text('Taken',
                                style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
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
      },
    );
  }
}