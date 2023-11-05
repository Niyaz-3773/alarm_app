import 'package:alarm_app/home_pages/buy_varidose_page.dart';
import 'package:alarm_app/home_pages/paired_varidose.dart';
import 'package:flutter/material.dart';

class WifiAvailablePage extends StatelessWidget {
  List<String> wifiAvailableList=['Free_wifi','Home_airtel','pyxell_5G'];

  WifiAvailablePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:const Text(
          'WiFi available',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ), 
        centerTitle: true,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,size: 15,)
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
          child: ListView.builder(
            itemCount: wifiAvailableList.length,
            itemBuilder: (BuildContext context,index){
              return ListTile(
                leading: const Icon(Icons.wifi),
                title: Transform.translate(
                  offset:const Offset (-16,0),
                  child:Text(
                       wifiAvailableList[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                trailing: TextButton(
                  onPressed: (){
                    _addingNetwork(context,wifiAvailableList[index]);
                  }, 
                  child:const Text(
                    'add',
                    style:TextStyle(
                      color: Color.fromARGB(255, 97, 232, 234),
                    ),
                  )
                ),
              );
            }
          ),
        ),

      ),
    );
  }

  _addingNetwork(BuildContext context, String wifiName){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
       return Padding(
          padding:const EdgeInsets.all(25),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:const Icon(Icons.close,size: 15,),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    wifiName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 3,),

                TextFormField(
                  style:const TextStyle(color: Colors.black,fontSize: 16),  
                  cursorColor: Colors.black,
                  obscureText: true, 
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.1)
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:const BorderSide(
                        color: Colors.grey
                      )
                    )                   
                  ),
                ),
                const SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                   _confirmationBottomSheet(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    decoration: const BoxDecoration(
                      color:Color.fromARGB(255, 97, 232, 234),
                      borderRadius:BorderRadius.all(Radius.circular(20)),        
                    ),
                    child:const Center(
                      child: Text(
                        'Join',
                        style:TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                )           
              ],
            ),
          ),
        );      
      },
    );
  }

  _confirmationBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
       return Padding(
        padding: const EdgeInsets.all(25.0),
         child: SizedBox(
          height: MediaQuery.of(context).size.height*0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:const Icon(Icons.close,size: 15,),
                ),
              ),
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(8)),
                   color:const Color.fromARGB(255, 153, 195, 214).withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(Icons.check_circle_outline_outlined,color: Colors.green,),
                    SizedBox(width: 8,),
                    Text(
                      'Connected',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 18
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.6,
                child: const Text(
                  'Confirm the blue light is blinking',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.25,
                child: const Text(
                  'in the device',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>const PairedVaridose())
                      );
                    }, 
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Color.fromARGB(255, 97, 232, 234),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  const SizedBox(width: 50,),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>const BuyVaridosePage())
                      );
                    }, 
                    child: const Text(
                      'No',
                      style: TextStyle(
                        color: Color.fromARGB(255, 97, 232, 234),
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
       );      
      },
    );
  }
}