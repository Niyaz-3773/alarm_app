import 'package:alarm_app/aditional_pages/faqs_screen.dart';
import 'package:alarm_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BuyVaridosePage extends StatelessWidget {
  const BuyVaridosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar:  AppBar(
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
          leading:IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 16,)
          ),
         ),
         body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 185, 237, 238),
                  Color.fromARGB(255, 255, 255, 255)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          child: Column(
            children: [
              Image(
                image:const AssetImage('assets/images/cabinet.jpg'),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height* 0.35,
              ),
              const SizedBox(height:7),

              textData('Varidose is a smart device to assist chronic',0.7, context),
              textData('disease patients adhere to their medication plan.', 0.8, context),
              const SizedBox(height: 5,),
              textData('The device can be used at home or on the go for', 0.8, context),
              textData('managing single/multiple prescriptions and',0.7, context),
              textData('refills seamlessly.',0.3, context),

              SizedBox(height: MediaQuery.of(context).size.height*0.04,),
              buyVaridose('Buy Varidose', 'Vardose has 9 cabinets',0.4, context),
              const SizedBox(height: 15,),
              buyVaridose('Buy Varidose small', 'Varidose small has 3 cabinets',0.5, context)          
            ],
          ), 
        ),
      ) 
    );
  }

  textData(String text,double width,BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width*width,
      child: Text(
        text,
        style:const TextStyle(
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }

  buyVaridose(String text,String subText,double width,BuildContext context){
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if(text=='Buy Varidose'){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const FaqsPage())
              );
            }else{
              Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const HomeScreen())
              );
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height*0.075,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: const BoxDecoration(
              color:Color.fromARGB(255, 97, 232, 234),
              borderRadius:BorderRadius.all(Radius.circular(20)),        
            ),
            child: Center(
              child: Text(
                text,
                style:const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2,),
        SizedBox(
          width: MediaQuery.of(context).size.width*width,
          child: Text(
            subText,
            style:const TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 47, 47, 47),
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ],
    );
  }
}