import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class  CourseDetailRepo{

  static Future<CourseDetailResponseEntity> courseDetail({
CourseRequestEntity ?parms ,
}) async {

    var response = await HttpUtil().post(
        'https:api' ,
      queryParameters: parms?.toJson() ,

    );

 return   CourseDetailResponseEntity.fromJson(response) ;




}



}