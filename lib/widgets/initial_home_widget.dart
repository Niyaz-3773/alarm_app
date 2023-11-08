import 'package:flutter/cupertino.dart';

class InitialHomeWidget extends StatelessWidget {
  const InitialHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(           
              borderRadius: BorderRadius.circular(20), 
              border: Border.all(
                color:const Color.fromARGB(255, 97, 232, 234),
                width: 1.0, 
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/medicine.jpg',
                  height:150,
                  width: 150,
                ),
                const  Text(
                  'Add your medicine',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                )
                    
              ],
            ),
          ),             
          const SizedBox(height: 30,),                
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(           
              borderRadius: BorderRadius.circular(20), 
              color:const Color.fromARGB(255, 97, 232, 234)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/cabinet.jpg',
                  height:100,
                  width: 100,
                ),
                const  Text(
                  'Pair your device',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),
                )                    
              ],
            ),
          )
        ],
      ),
    );
  }
}