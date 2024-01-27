import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';
import 'package:ulearning_app/common/widgets/widget.dart';
import 'package:ulearning_app/pages/welcome/notifier/welcome_notifire.dart';


//final indexProvider = StateProvider((ref) => 0) ;

class   Welcome extends ConsumerWidget {

   final PageController _controller = PageController() ;

  int dotsIndex=0 ;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return  Container(
      color: Colors.white,

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          body: Container(
            margin: EdgeInsets.only(
              top: 30.0
            ),
            child: Stack(
              alignment: Alignment.topCenter,
            children: [
              //showing our three welcome pages
              PageView(
                onPageChanged: (value){

                   dotsIndex=value ;
              ref.read(indexDotProvider.notifier).changeIndex(value) ;

                   },

                controller: _controller,

                children: [

                appOnBoardingPage(
                 _controller,
                  title: 'First See Learning ',
                    imagePath: ImageRes.reading,

                  subTitle: 'Forget about for paper all knowledge in only learning' ,
                  index:1 ,
                  context: context

                ) ,
                appOnBoardingPage(
                  _controller ,
                  imagePath: ImageRes.man,
                  title: 'Connect With every One ',
                  subTitle: 'Always keep touch with your friends    ',
                  index:2 ,
                  context: context
                ) ,
                  appOnBoardingPage(

                    _controller ,
                      imagePath: ImageRes.boy,
                      title: 'Always Fascinated ',
                      subTitle: 'Anywhere , any time ,the time is at your discretion .so study where ever ',
                    index:3 ,
                    buttonText: 'Get Started',
                    context: context
                  ) ,


                ],
              ) ,
         // for showing dots

            Positioned(
                  child:DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: Size.square(9.0) ,
                      activeSize: Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0) ,

                      )




                    ),
                  ) ,
                bottom: 50.0,
               // left: 20,

              ) ,

            ],
            ),
          ),
        ),
      ),
    );
  }
}
