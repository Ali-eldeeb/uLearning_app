


import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';

Widget appTextField ({
  required String text ,
  required String iconName,
  required String hintText,
  bool obscureText=false ,
 void  Function(String value)? func ,
  TextEditingController? controller ,
}){

  return Container(
    padding: EdgeInsets.only(
      left: 25.0,
      right: 25.0  ,

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text:text ) ,
        SizedBox(
          height: 5.0,
        ) ,
        Container(

          width: 325.0,
          height: 50.0,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [

              Padding(
                padding: const EdgeInsets.only(
                    left: 17
                ),
                child: Container(

                    child: appImage(imagePath:  iconName ,)

                ),
              ),
         appTextFieldOnly(
             hintText: hintText ,
           controller: controller,
           obscureText: obscureText,
           func: func

         )

            ],
          ),
        )
      ],
    ),
  ) ;

}

Widget textUnderLine(
    {
      String  text = 'your Text '
    }
    ){
  return GestureDetector(
    onTap: (){

    },
    child: Text(
      text,
      style: TextStyle(
          color:AppColors.primaryText ,
          decoration: TextDecoration.underline ,
          decorationColor: AppColors.primaryText ,
          fontWeight: FontWeight.normal ,
          fontSize: 12.0
      ),

    ),


  ) ;

}

Widget appTextFieldOnly ({
 required String hintText ,
double width=280,
double height=50,
  void  Function(String value)? func ,
  TextEditingController? controller ,
  bool obscureText=false ,

}) =>   SizedBox  (
    width: width,
    height: height,
    child: TextField(

      controller: controller,
      onChanged: (value)=>func!(value),
      keyboardType: TextInputType.multiline,
      decoration:InputDecoration(
        contentPadding: EdgeInsets.only(  left: 10.0),
          hintText:hintText ,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            ) ,
          )
      ),

      maxLines: 1,
      autocorrect: false,
      obscureText:obscureText ,


    )
) ;



