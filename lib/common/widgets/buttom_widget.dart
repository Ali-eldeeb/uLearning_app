import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';

Widget appBottom ({
String buttonName = '' ,
  double width =325.0 ,
  double height =50.0 ,
    bool isLogin =true ,
 required BuildContext context ,
  void Function()? func ,


}){
  return GestureDetector(
    onTap: func ,

    child: Container(

      width: width,
      height: height,
      decoration: appBoxShadow(
        color:isLogin ?AppColors.primaryElement:Colors.white ,
        boxBorder: Border.all(color: AppColors.primaryFourElementText)
      ),
      child:Center(child: Text16Normal(
        text: buttonName  ,
        color:isLogin ? AppColors.primaryBackground:AppColors.primaryElement

      )) ,


    ),
  ) ;

}