import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  double sR = 1.0,
  double bR = 2.0,
  bool isLogin = true,
  BoxBorder? boxBorder,
}) =>
    BoxDecoration(
        color: color,
        border: boxBorder,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1),
          )
        ]);
BoxDecoration appBoxShadowWithRadius(
        {Color color = AppColors.primaryElement,
        double radius = 15.0,
        double sR = 1.0,
        double bR = 2.0,
        bool isLogin = true,
        BoxBorder? border}) =>
    BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1),
          )
        ]);

BoxDecoration appBoxDecorationTextField(
        {Color color = AppColors.primaryBackground,
        double radius = 15.0,
        Color borderColor = AppColors.primaryFourElementText}) =>
    BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor));

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
 final CourseItem? courseItem ;
 final Function ? func ;
  const AppBoxDecorationImage(
      {super.key,
      this.width = 40.0,
      this.height = 40.0,
      this.imagePath = ImageRes.profilePhoto ,
      this.fit =BoxFit.fitHeight ,
         this.courseItem ,
        this.func
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        func ;
      },
      child: Container(
        width: height,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: fit,
            image: NetworkImage(imagePath),
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: courseItem==null ?Container():Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20.0 ,

              ),
              child:FadeText(
                text: courseItem!.name!,
              ),
            ) ,
            Container(
              margin: EdgeInsets.only(
                left: 20.0 ,
                bottom: 40.0
              ),
              child:FadeText(
                text: '${courseItem!.lesson_num!} Lessons',
                color: AppColors.primaryFourElementText,
                fontSize: 8.0,
              ),
            ) ,
          ],
        ),


      ),
    );
  }
}
