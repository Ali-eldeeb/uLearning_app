import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';

Widget appOnBoardingPage (
PageController _controller ,
{
  String imagePath='assets/images/reading.png',
  String title = '',
  String subTitle = '',
  int index =1 ,
  String buttonText ='next' ,
  required BuildContext  context ,


})=> Column(
  children: [
    Image.asset(imagePath,fit: BoxFit.fitHeight,),
    Container(
      margin: EdgeInsets.only(
        top: 15.0 ,
      ),
      child: text24Normal(
          text: title
      ),
    ),
    Container(
      margin: EdgeInsets.only(
        top: 15.0 ,),
      padding: EdgeInsets.only(
        left: 30.0 ,
        right: 30.0,
      ),
      child: Text16Normal(
          text: subTitle
      ),
    ),

    _nextBottom(index,_controller,buttonText,context) ,


  ],
)  ;



Widget _nextBottom(int index,PageController controller,String text,BuildContext context  ) => GestureDetector(
  onTap: (){
    if(index<3){
      controller.animateToPage(index,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear
      );
    }else {
      Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY  , true) ;

      Navigator.push(
        context,
      MaterialPageRoute(
          builder:( context)=>SignIn(),
      )
      );
    }

  },
  child:   Container(
  
    width: 325.0,
  
    height: 50.0,
  
  
  
    margin: const EdgeInsets.only(
  
      top: 100.0 ,
  
      right: 25 ,
  
      left: 25 ,
  
    ),
  
    decoration: appBoxShadow(),
  
    child: Center(
  
      child: Text16Normal(
  
          text:text,
  
        color: Colors.white ,
  

      ),

  
    ),
  
  
  
  ),
);

