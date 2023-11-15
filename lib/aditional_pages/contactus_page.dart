import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void launchPhoneDail(String phoneNo) async {
    Uri dialNum=Uri(scheme: 'tel',path: phoneNo);
    await launchUrl(dialNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Contact us',
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
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
        child: Column(
          children: [
            contactusItems(context, 'Call us', '+91 8999898970', 'assets/images/phone-call.svg'),
            const SizedBox(height: 10,),
            contactusItems(context, 'Email us', 'hello@pyxill.com', 'assets/images/mail.svg'),

          ],
        ),
      ),
    );
  }

  contactusItems(BuildContext context,String title, String subtitle,String imagePath){
    return InkWell(
      onTap: () {
        if(title =='Call us'){
          launchPhoneDail(subtitle);
        }
      },
      child: Container(
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
          child: Center(
            child: ListTile(
              title:Text(
                title,
                style:const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),
              ),
              subtitle:Text(
                subtitle,
                style:const TextStyle(
                  fontSize: 18,
                  color:Colors.grey
                ),
              ),
              trailing: SvgPicture.asset(
                imagePath,
                width: 30,  
                height: 30, 
              ),
            ),
          ),
      ),
    );
  }
}