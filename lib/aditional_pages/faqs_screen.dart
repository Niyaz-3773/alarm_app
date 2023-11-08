import 'package:flutter/material.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({super.key});

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  bool isTapped=false;
  int? _value;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'FAQs',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
            letterSpacing:0.1
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
        body:SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: MediaQuery.of(context).size.width*0.05,),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: const Text(
                      'How can we help you?',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.07,
                    child: TextFormField(
                      style:const TextStyle(color: Colors.black,fontSize: 16),  
                      cursorColor: Colors.black, 
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded, size: 25,color: Colors.black,),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        contentPadding:const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Enter your keyword",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.1)
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.1)
                          )
                        )                   
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  instructionContainer('Lorem ipsum dolor sit amet, consectetur adipiscing elit?',1),
                  if(isTapped && _value==1 )
                    detailInstructions(),

                  const SizedBox(height: 8,),
                  instructionContainer('Vivamus sagittis, massa et gravida accumsan',2),
                  if(isTapped && _value==2)
                    detailInstructions(),

                  const SizedBox(height: 8,),
                  instructionContainer('Nulla sodales dui quam, nec semper magna aliquam nec?',3),
                  if(isTapped && _value==3)
                    detailInstructions(),

                  const SizedBox(height: 8,),
                  instructionContainer('Sed interdum ac turpis nec mollis  tempus lacus vel lectus euismod?',4),
                  if(isTapped && _value==4)
                    detailInstructions(),

                  const SizedBox(height: 8,),
                  instructionContainer('Sed interdum ac turpis nec mollis  tempus lacus vel lectus euismod ?',5),
                  if(isTapped && _value==5)
                    detailInstructions(),

                ],
              ),
            ),
          )    
        ) ,
      ),
    );
  }

  instructionContainer(String text,int value){
    return Container(
      padding: const EdgeInsets.all(6.0),
      height: MediaQuery.of(context).size.height*0.10,
      decoration: BoxDecoration(
        border: isTapped && _value==value?
          Border(
            top:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
            right:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
            left:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
          )
          : Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2.0
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width:MediaQuery.of(context).size.width*0.7,
            child:Text(
              text,
              style:const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isTapped =!isTapped;
                _value=value;
              });
            },
            icon: isTapped && _value==value? const Icon(Icons.remove,size: 22,color: Colors.blueAccent,)
              : const Icon(Icons.add,size: 22,color: Colors.blueAccent,),
          ),
        ],
      ),
    );
  }

  detailInstructions(){
    return Container(
      padding: const EdgeInsets.all(9.0),
      height: MediaQuery.of(context).size.height*0.15,
      decoration: BoxDecoration(
        border: Border(
          left:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
          right:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
          bottom:  BorderSide(color: Colors.grey.withOpacity(0.5), width: 2.0),
        )
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        child: const Text('Open the Tradebase app to get started and follow the steps'
          'Tradebase doesn’t charge a fee to create or maintain your Tradebase account.',
          style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 125, 125, 125),
          fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}