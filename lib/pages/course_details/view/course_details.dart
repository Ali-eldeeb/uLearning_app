import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/pages/course_details/controller/course_detail_controller.dart';

class CourseDetails extends ConsumerStatefulWidget {
  const CourseDetails(CourseItem data, {super.key});

  @override
  ConsumerState<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends ConsumerState<CourseDetails> {
  late var args ;
  @override
  void didChangeDependencies() {


    var id =ModalRoute.of(context)!.settings.arguments as Map ;
    args=id['id'] ;
    // TODO: implement didChangeDependencies


  }
  @override
  Widget build(BuildContext context) {

    var stateData=ref.watch(courseDetailsControllerProvider(index: args.toInt())) ;
    return Scaffold(
      appBar: AppBar(),
      body: stateData.when(
          data:(data)=>data==null?SizedBox():Column(
            children: [

              AppBoxDecorationImage(
                imagePath: '${AppConstants.IMAGE_UPLOADS_path}${data.thumbnail}',
                width: ,
              )
            ],
          ) ,
          error:(error ,TtrackStack )=>Text(
            'errrrrrror'
          ) ,
          loading:()=>Center(
            child: CircularProgressIndicator(),
          )
      ),
      
    );
  }
}
