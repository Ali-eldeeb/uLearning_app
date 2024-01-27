import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/course_details/view/course_details.dart';
import 'package:ulearning_app/pages/homw/controller/home_controller.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.0,
          height: 160.0,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerCountainer(imagePath: ImageRes.banner1),
              bannerCountainer(imagePath: ImageRes.banner2),
              bannerCountainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: Size.square(9.0),
              activeSize: Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              )),
        ),
      ],
    );
  }
}

Widget bannerCountainer({
  String imagePath = 'assets/icons/Art.png',
}) =>
    Container(
      width: 325,
      height: 160.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
    );

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: text24Normal(
            text: Global.storageService.getUserProfile().name!,
            fontWeight: FontWeight.bold));
  }
}

class HelloText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: text24Normal(
            text: 'Hello',
            color: AppColors.primaryThreeElementText,
            fontWeight: FontWeight.bold));
  }
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);

  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.0, right: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(imagePath: ImageRes.menu, height: 12.0, width: 15.0),
          profileState.when(
            data: (value) => GestureDetector(
              child: AppBoxDecorationImage(
                imagePath: value.avatar!,
              ),
            ),
            error: (error, stack) => appImage(
                imagePath: ImageRes.profilePhoto, height: 12.0, width: 15.0),
            loading: () => Container(),
          ),
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text16Normal(
                  text: 'Choise your course',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                )),
                GestureDetector(
                  child: Text10Normal(
                    text: 'See all',
                    color: AppColors.primaryThreeElementText,
                  ),
                )
              ],
            )),
        //list nos elsaf7a
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Container(
              child: Text11Normal(text: 'All'),
              decoration: appBoxShadow(color: Colors.blue, radius: 7.0),
              padding: EdgeInsets.only(
                  top: 5.0, right: 15.0, left: 15.0, bottom: 5.0),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0),
              child: Text11Normal(
                text: 'popular',
                color: AppColors.primaryThreeElementText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0),
              child: Text11Normal(
                text: 'Newest',
                color: AppColors.primaryThreeElementText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CourseItemGred extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGred({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    return courseState.when(
        data: (data) => GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6, crossAxisCount: 2),
            itemCount: data?.length,
            itemBuilder: (_, int index) {
              return AppBoxDecorationImage(
                courseItem: data![index],
                imagePath: '${data[index].thumbnail}',
                fit: BoxFit.fitWidth,
                func: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>CourseDetails(data[index])
                    ));

                },
              );
            }),
        error: (error, stackTrack) {
          print(error.toString());
          print(stackTrack);
          return Container(
            child: Text('feh error ya price '),
          );
        },
        loading: () => Container(
              child: Text('loasding'),
            ));
  }
}
