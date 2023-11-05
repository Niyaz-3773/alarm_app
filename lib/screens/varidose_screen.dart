
import 'package:alarm_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/alarm_datail_provider.dart';

class VaridosePage extends StatefulWidget {
  const VaridosePage({super.key});

  @override
  State<VaridosePage> createState() => _VaridosePageState();
}

class _VaridosePageState extends State<VaridosePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AlarmDetailProvider>(
        builder:(context,alarmDetail,child) => Scaffold(
          appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Varidose',
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
               Navigator.push(context,
                MaterialPageRoute(builder: (context) =>const HomeScreen())
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
              Navigator.pop(context);
              },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 16,)
          ),
         ),
      
         body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.08),         
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const SizedBox(height: 10,),
                  const Text(
                    'Select the cabinet number',
                    style:  TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 52, 52, 52) ,
                       fontWeight: FontWeight.w400   
                    ),
                  ),
                   const SizedBox(height: 5,),
      
                   Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildCabinetNumContainer('1'),
                            _buildCabinetNumContainer('2'),
                            _buildCabinetNumContainer('3'),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildCabinetNumContainer('4'),
                            _buildCabinetNumContainer('5'),
                            _buildCabinetNumContainer('6'),
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            _buildCabinetNumContainer('7'),
                            _buildCabinetNumContainer('8'),
                            _buildCabinetNumContainer('9'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    const Text(
                      'Total medicine in stock',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 52, 52, 52),
                        fontWeight: FontWeight.w400,  
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 43,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 1.0
                        )
                      ),
                      child: const Text(
                        '250 ml',
                        style: TextStyle(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                     const SizedBox(height: 25,),
                     SizedBox(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color:Color.fromARGB(255, 97, 232, 234),
                              ),
                              child:const Center(
                                child: Icon(Icons.check,color: Colors.white, size: 11,),
                              ),
                            ),const SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                  Text(
                                    'Autofill reminder',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  SizedBox(height: 2,),
                                  Text(
                                    "We'll reminde you when 5 doses are left",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 124, 123, 123),
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic
                                    ),
                                  )
                              ],
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    const SizedBox(
                      height: 100,
                      width: 300,
                      child: Center(
                        child: Text(
                          'I do not have Varidose',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 97, 232, 234),
                            fontSize: 17
                          ),
                        ),
                      ),
                    ),
              ],
            ), 
          ),
        ),
      
        ),
      )
    );
  }

  _buildCabinetNumContainer(String text){
    return Consumer<AlarmDetailProvider>(
      builder:(context,alarmDetails,child) => GestureDetector(
        onTap: () {
            alarmDetails.setCabinateNum(text);
        },
        child: Container(
        width: 95,
        height: 35,
        decoration: BoxDecoration(
          color:alarmDetails.cabinateNum == text ?const Color.fromARGB(255, 97, 232, 234) :  Colors.white,
          borderRadius:const BorderRadius.all(Radius.circular(20)),
          border: alarmDetails.cabinateNum==text ? null :Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: alarmDetails.cabinateNum == text ? Colors.black : Colors.grey,
          ),
          ),
        ),       
        ),
      ),
    );

  }
}