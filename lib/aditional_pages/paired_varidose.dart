
import 'package:alarm_app/aditional_pages/remove_varidose_bottomsheet.dart';
import 'package:alarm_app/aditional_pages/wifi_available_page.dart';
import 'package:alarm_app/controller/varidose_controller.dart';
import 'package:alarm_app/model/varidose_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class PairedVaridose extends StatefulWidget {
  const PairedVaridose({super.key});

  @override
  State<PairedVaridose> createState() => _PairedVaridoseState();
}

class _PairedVaridoseState extends State<PairedVaridose> {
  VaridoseController varidoseController=Get.put(VaridoseController());
  
  bool tappedEdit=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Paired Varidoses',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ), 
          centerTitle: true,
          actions: [
            TextButton(
            onPressed: (){
              //  setState(() {
              //    tappedEdit=!tappedEdit;
              //  });
            }, 
            child:const Text(
              'Edit',
              style: TextStyle(
                color:Color.fromARGB(255, 97, 232, 234),
                fontSize: 16
                ),
              )
            )
          ],        
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
          child: Obx(
            (() {
              //print('Rebuilding Obx: ${varidoseController.currentIndex.value}');
              return  ListView.builder(
            itemCount: varidoseController.varidoseList.length,
            itemBuilder: (BuildContext context, index) {
              VaridoseModel item = varidoseController.varidoseList[index];
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.12,
                    decoration: BoxDecoration(                
                      borderRadius:const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                        boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:const Offset(0, 4), 
                        ),
                      ],
                    ),
                      child: ListTile(
                        leading: SvgPicture.asset(
                          'assets/images/box.svg',
                          width: 40,  
                          height: 40, 
                        ),
                        title: Text(
                          item.varidoseName,
                          style:const TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        subtitle:Text(
                          item.serialNum,
                          style:const TextStyle(
                            fontSize: 15,
                            color:Colors.grey
                          ),
                        ),
                        trailing: tappedEdit
                        ?TextButton(
                          onPressed: () {
                            showBottomSheet(index);
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(
                              color:Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        )     
                        : IconButton(
                          onPressed:(() {
                              varidoseController.setIndex(index);
                          }) , 
                          icon: const Icon(Icons.keyboard_arrow_down,color: Color.fromARGB(255, 97, 232, 234),size: 30,)
                        )
                      ),
                  ),
                   const SizedBox(height: 7,),
                    if (varidoseController.currentIndex.value == index)
                    deviceDetails(item.serialNum), 
                                
                ],
              );

            });
          }
          )       
        ),
      ), 
    )
    );
  }
 

  deviceDetails(String serialNum){
    return Container(
      height: MediaQuery.of(context).size.height*0.4,
      padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 15),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Device Serial Number',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17
            ),
          ),
          const SizedBox(height: 3,),
           Text(
            serialNum,
            style:const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'No of cabinets',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17
            ),
          ),
          const SizedBox(height: 3,),
          const Text(
            '09',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Firmware Version',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17
            ),
          ),
          const SizedBox(height: 3,),
          const Text(
            'v1.0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>WifiAvailablePage())
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height*0.07,
              decoration:const BoxDecoration(
                color: Color.fromARGB(255, 97, 232, 234),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child:const Text(
                'Connect',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  showBottomSheet(int index){
    showModalBottomSheet(
      context: context,
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return RemoveVaridoseBottomsheet(index);      
      },
    );
  }
}

