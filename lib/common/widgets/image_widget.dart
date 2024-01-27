import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage(
{
  String imagePath = ImageRes.defoultImage ,
  double width=16 ,
  double height=16 ,
}
    ){
  return Image.asset(
      imagePath.isEmpty?ImageRes.defoultImage:imagePath,
    width: width,
    height: height,

  ) ;

}

Widget appImageWithColor(
{
  String imagePath = ImageRes.defoultImage ,
  double width=16 ,
  double height=16 ,
  Color color= AppColors.primaryElement ,
}
    ){
  return Image.asset(
      imagePath.isEmpty?ImageRes.defoultImage:imagePath,
    width: width,
    height: height,
    color: color,
  ) ;

}