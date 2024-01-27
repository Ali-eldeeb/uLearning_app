
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';


Widget text24Normal ({
  String text ='',
  Color color = AppColors.primaryText ,
  FontWeight fontWeight= FontWeight.normal
})
{
  return   Text(
  text ,
  textAlign: TextAlign.center,
  style:  TextStyle(
      color:color ,
      fontSize: 24.0 ,
      fontWeight: fontWeight

  ),
) ;

}





class Text16Normal extends StatelessWidget {
 final String text ;
 final Color color ;
 final FontWeight fontWeight ;
  const Text16Normal({super.key,this.text='',
    this.color=AppColors.primarySecondaryBackground,
    this.fontWeight =FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      textAlign: TextAlign.center,
      style: TextStyle(
          color:color ,
          fontSize: 16.0 ,
          fontWeight: fontWeight

      ),
    ) ;
  }
}
class Text10Normal extends StatelessWidget {
 final String text ;
 final Color color ;

  const Text10Normal({super.key,this.text='',
    this.color=AppColors.primaryThreeElementText,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      textAlign: TextAlign.center,
      style: TextStyle(
          color:color ,
          fontSize: 10.0 ,


      ),
    ) ;
  }
}
class Text11Normal extends StatelessWidget {
 final String text ;
 final Color color ;

  const Text11Normal({super.key,this.text='',
    this.color=AppColors.primaryElementText,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      textAlign: TextAlign.center,
      style: TextStyle(
          color:color ,
          fontSize: 11.0 ,


      ),
    ) ;
  }
}


Widget text14Normal ({
  required String text ,
  Color color =AppColors.primaryThreeElementText
})
{
  return   Text(
    text ,
    textAlign: TextAlign.center,
    style: TextStyle(
        color:color ,
        fontSize: 14.0 ,
        fontWeight: FontWeight.normal

    ),
  ) ;

}


class FadeText extends StatelessWidget {
  final String text ;
  final Color color ;
  final double fontSize ;

  const FadeText({super.key,this.text='',
    this.color=AppColors.primaryElementText ,
    this.fontSize =10.0

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
      textAlign: TextAlign.left,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color:color ,
        fontSize: fontSize ,
        fontWeight: FontWeight.bold


      ),
    ) ;
  }
}



