import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';


Widget thiredPartyLogin (){

return Container(
  margin: EdgeInsets.only(
    right: 80.0 ,
    left: 80.0 ,
    top: 40.0 ,
    bottom: 20.0
  ),

  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,

    children: [

      _loginIconButtom( 'assets/icons/google.png'),
      _loginIconButtom( 'assets/icons/apple.png'),
      _loginIconButtom( 'assets/icons/facebook.png'),

    ],

  ),
) ;

}


Widget _loginIconButtom(String imagePath){

  return GestureDetector(
    child: Container(
      width: 40.0,
      height: 40.0,
      child: Image.asset(
       imagePath ,
      ),
    ),

  );

}



