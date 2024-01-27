import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_textfield.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';

Widget searchBar(){


return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Container(
      width: 280.0,
      height: 40.0,
      decoration: appBoxShadow(
        color: AppColors.primaryBackground,
        boxBorder: Border.all(
          color: AppColors.primaryFourElementText
        )
      ),
      child: Row(
        children: [
          Container(
            child: appImage(
              imagePath:ImageRes.search
            ),
            margin: EdgeInsets.only(
              left: 17.0
            ),

          ) ,

          SizedBox(
            width: 240.0,
              height: 40.0 ,

              child: appTextFieldOnly(
                  hintText:'Search your course...' ,
              width: 240.0 ,
                height: 40.0
              )

          ) ,


        ],
      ),

    ) ,
    GestureDetector(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: 40.0,
        height: 40.0,
        decoration: appBoxShadow(
          boxBorder: Border.all(
            color: AppColors.primaryElement
          )
        ),
        child: appImage(
          imagePath: ImageRes.searchButton
        ),
      ),
    ) ,

  ],
) ;
}