

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';
import 'package:ulearning_app/pages/homw/view/home.dart';

var bottomTabs=<BottomNavigationBarItem>[
  BottomNavigationBarItem(

      icon:_bottomContainer(
        imagePath: ImageRes.home) ,
    activeIcon:_bottomContainer(
      color: AppColors.primaryElement ,
        imagePath: ImageRes.home) ,
    backgroundColor: AppColors.primaryBackground,
    label: 'Home'
  ),
  BottomNavigationBarItem(

      icon:_bottomContainer(
          imagePath: ImageRes.search) ,
      activeIcon:_bottomContainer(
          color: AppColors.primaryElement ,
          imagePath: ImageRes.search) ,
      backgroundColor: AppColors.primaryBackground,
      label: 'Search'
  ),
  BottomNavigationBarItem(

      icon:_bottomContainer(
          imagePath: ImageRes.play) ,
      activeIcon:_bottomContainer(
          color: AppColors.primaryElement ,
          imagePath: ImageRes.play) ,
      backgroundColor: AppColors.primaryBackground,
      label: 'Play'
  ),
  BottomNavigationBarItem(

      icon:_bottomContainer(
          imagePath: ImageRes.message) ,
      activeIcon:_bottomContainer(
          color: AppColors.primaryElement ,
          imagePath: ImageRes.message) ,
      backgroundColor: AppColors.primaryBackground,
      label: 'Message'
  ),
  BottomNavigationBarItem(

      icon:_bottomContainer(
          imagePath:ImageRes.profilePhoto) ,
      activeIcon:_bottomContainer(
          color: AppColors.primaryElement ,
          imagePath: ImageRes.profilePhoto) ,
      backgroundColor: AppColors.primaryBackground,
      label: 'Profile'
  ),


];

Widget _bottomContainer({
double width = 15.0 ,
double height = 15.0 ,
  String imagePath ='assets/icons/profile.png' ,
  Color color = AppColors.primaryFourElementText

})=>Container(
  width:width ,
height: height,
child:appImageWithColor(
imagePath: imagePath,
color: color
) ,

);

Widget appScreens({
  int index =1 ,
}){

List<Widget> screens =
[
 Home(),
  Container(
    child: Center(child: Text('play',style: TextStyle(fontSize: 100.0),),),
  ),
  Container(
    child: Center(child: Text('search',style: TextStyle(fontSize: 100.0),),),
  ),
  Container(
    child: Center(child: Text('profile',style: TextStyle(fontSize: 100.0),),),
  ),
  Container(
    child: Center(child: Text('message',style: TextStyle(fontSize: 100.0),),),
  ),

] ;

return screens[index] ;


}
















