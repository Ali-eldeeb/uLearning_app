import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routs/app_routs_name.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/course_details/view/course_details.dart';
import 'package:ulearning_app/pages/homw/view/home.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPage{

static List<dynamic>routs() {

  return [
RoiuteEntity(path: AppRoutesName.WELCOM, page: Welcome()) ,
RoiuteEntity(path: AppRoutesName.SIGN_IN, page: SignIn()) ,
RoiuteEntity(path: AppRoutesName.REGISTER, page: SignUp()) ,
RoiuteEntity(path: AppRoutesName.APPLICATION, page: Application()) ,
RoiuteEntity(path: AppRoutesName.HOME, page: Home()) ,
RoiuteEntity(path: AppRoutesName.COURSE_DETAILS, page: CourseDetails()) ,
  ] ;

}


static MaterialPageRoute generatRouteSetting(RouteSettings settings) {

  if(kDebugMode){
    print('click root${settings.name}') ;
  }
  if(settings.name!=null){
    var result= routs().where((element) => element.path==settings.name) ;
    print(result.isNotEmpty) ;
  bool devistFirstTime=Global.storageService.getDeviceFirstOpen() ;
  if(result.first.path==devistFirstTime){

    return MaterialPageRoute(builder:(_)=>SignIn() ,
        settings: settings
    )  ;

  }

  }

  return MaterialPageRoute(builder:(_)=>Welcome() ,
  settings: settings
  )  ;
}

}
class RoiuteEntity{
String path ;
Widget page ;
RoiuteEntity({
  required this.path ,
  required this.page ,

}) ;


}
