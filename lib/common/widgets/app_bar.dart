import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';

AppBar buildAppbar({
  String text = 'Log In'
})
{
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(

      child: Container(

        color: Colors.grey.withOpacity(0.3),
        height: 1.0,
      ),
      preferredSize: Size.fromHeight(1.0),

    ) ,
    title: Text16Normal(
        text: text ,
        color: AppColors.primaryText
    ),
  ) ;
}

