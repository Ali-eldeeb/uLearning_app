
import 'package:ulearning_app/common/models/course_entity.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/course_details/repo/course_details_repo.dart';
import 'package:ulearning_app/pages/homw/controller/home_controller.dart';
part 'course_detail_controller.g.dart';
@riverpod

Future<CourseItem?>courseDetailsController (CourseDetailsControllerRef ref , {
  required int index
}) async {


  CourseRequestEntity courseRequestEntity =CourseRequestEntity() ;
  courseRequestEntity.id =1 ;
  final response =await CourseDetailRepo.courseDetail(
    parms: courseRequestEntity
  ) ;
  if(response.code ==200) {
    return response.data ;
  }
  else {
    print('request faild ${response.code}') ;
  }

return null ;

}