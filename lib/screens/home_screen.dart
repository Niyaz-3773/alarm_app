import 'package:alarm_app/aditional_pages/contactus_page.dart';
import 'package:alarm_app/screens/add_med_info.dart';
import 'package:alarm_app/screens/device_setting.dart';
import 'package:alarm_app/home_page_widgets/alarm_added_widget.dart';
import 'package:alarm_app/home_page_widgets/initial_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/alarm_datail_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
          body: Consumer<AlarmDetailProvider>(
            builder:(context,alarmDetail,child)=> Column(
              children: [             
                //adherence score
                Container(
                  height: MediaQuery.of(context).size.height*0.23,
                  width: MediaQuery.of(context).size.width,
                    color:const  Color.fromARGB(255, 97, 232, 234)  
                ),

                if (alarmDetail.alarmList.isEmpty) 
                  const InitialHomeWidget()
                else 
                   const AlarmAddedWidget(),
                
                const SizedBox(height: 10,), 
                GestureDetector(
                  onTap: () {
                    
                  },
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Icon(Icons.add_box,
                        color:Color.fromARGB(255, 97, 232, 234)
                      ),
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
            
              ],
            ),
          ),

        //bottom Nav Bar
        bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          if(index==1){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const ContactUsPage())
            );
          }else if(index==2){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const AddMed())
            );
          }else if(index==3){
            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const DeviceSetting())
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
      );
 }
}