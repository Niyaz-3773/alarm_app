import 'package:alarm_app/screens/add_med_info.dart';
import 'package:alarm_app/screens/device_setting.dart';
import 'package:alarm_app/widgets/alarm_added_widget.dart';
import 'package:alarm_app/widgets/initial_home_widget.dart';
import 'package:flutter/material.dart';
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const [
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
          if(index==2){
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

  // void _showPopupContainer(BuildContext context) {
  //   showDialog(
  //     context: context,     
  //     builder: (BuildContext context) {
  //       return Center(
  //       child: Container(
  //         width: MediaQuery.of(context).size.width*0.65,
  //         height: MediaQuery.of(context).size.width*0.65,
  //         color: Colors.white,

  //         child: Padding(
  //           padding: const EdgeInsets.all(8),
  //           child:Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //             const  SizedBox(height: 8,),
  //               const Icon(
  //                 Icons.notifications,
  //                 size: 70,
  //                 color: Color.fromARGB(255, 225, 167, 80),
  //               ),
  //               const SizedBox(height: 15,),
    
  //               Container(
  //                 height: MediaQuery.of(context).size.height*0.04,
  //                 width: MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     color:const Color.fromARGB(255, 230, 189, 68).withOpacity(0.5),
  //                     borderRadius:const BorderRadius.all(Radius.circular(20)),        
  //                     ),
  //                     child: Center(
  //                       child: Text(
  //                         '8:00am',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.black.withOpacity(0.9),
  //                         fontWeight: FontWeight.w500,
  //                         decoration: TextDecoration.none,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
    
  //                   const SizedBox(height: 15,),                
  //                   Text(
  //                       'Paraciane',
  //                       style: TextStyle(
  //                         fontSize: 15,
  //                         fontWeight: FontWeight.w700,
  //                         color: Colors.black.withOpacity(0.7),
  //                         decoration: TextDecoration.none
  //                       ),
  //                     ),
                     
  //                   const SizedBox(height: 8.0,),
  //                   Text(
  //                     'Take 5.5ml from cabinet 2',
  //                     style: TextStyle(
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.w400,
  //                       color: Colors.grey.withOpacity(0.9),
  //                       decoration: TextDecoration.none
                        
  //                     ),                       
  //                   ),
  //                   const SizedBox(height: 14,),
                      
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         Text(
  //                           'Reschedule',
  //                           style: TextStyle(
  //                             fontSize: 16,
  //                             color: Colors.black.withOpacity(0.7),
  //                             fontWeight: FontWeight.w500,
  //                             decoration: TextDecoration.none
  //                           ),
  //                         ),
    
  //                         Container(
  //                         height: MediaQuery.of(context).size.height*0.04,
  //                         width: MediaQuery.of(context).size.width*0.2,
  //                         decoration: BoxDecoration(
  //                           color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.2),
  //                           borderRadius: const BorderRadius.all(Radius.circular(20)),
  //                           border: Border.all(
  //                             color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.9),
  //                             width: 1.0
  //                           )     
  //                           ),
  //                           child: Center(
  //                             child: Text('Taken',
  //                               style: TextStyle(
  //                             fontSize: 16,
  //                             color: Colors.black.withOpacity(0.9),
  //                             fontWeight: FontWeight.w500,
  //                             decoration: TextDecoration.none,
  //                             ),
  //                           ),
  //                           ),
  //                       ),
  //                     ],
  //                   )
  //             ],
  //           )
  //         ),
  //       ),
  //       );
  //     },
  //   );
  // }
}