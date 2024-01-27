import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CourseApi{


Future<CourseListResponseEntity>courseList() async {
     var responce= await HttpUtil().post(
       'api/courseList'
     );
return CourseListResponseEntity.fromJson(responce) ;

  }



}