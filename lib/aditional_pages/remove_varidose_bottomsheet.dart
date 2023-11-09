import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/varidose_controller.dart';


class RemoveVaridoseBottomsheet extends StatelessWidget {
  VaridoseController varidoseController=Get.put(VaridoseController());
  int index;
  RemoveVaridoseBottomsheet(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height*0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:const Icon(Icons.close,size: 17,),
              ),
            ),
            const Icon(Icons.delete_outline,color:Colors.red,size:50),
            const SizedBox(height: 20,),
            const Text(
              'Removing Varidose',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 5,),
            instructionText('Are you sure you want to'),
            instructionText('remove the device?'),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    varidoseController.removeVaridoseAt(index);
                    Navigator.pop(context);
                  }, 
                  child:const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color.fromARGB(255, 97, 232, 234),
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  ), 
                ),

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  width: MediaQuery.of(context).size.width*0.3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: const Color.fromARGB(255, 132, 239, 237).withOpacity(0.9),
                      width: 2.0
                    )     
                    ),
                    child:const Center(
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                      ),
                    ),
                    ),
                  ),
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  instructionText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.grey
      ),
    );
  }
}