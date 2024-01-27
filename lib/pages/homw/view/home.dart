import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/image_widget.dart';
import 'package:ulearning_app/common/widgets/search_widget.dart';
import 'package:ulearning_app/pages/homw/controller/home_controller.dart';
import 'package:ulearning_app/pages/homw/view/home_widgets.dart';
class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
 late PageController _controller ;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _controller =  PageController(initialPage:ref.watch(homeScreenBannerDotsProvider) ) ;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.white ,
      appBar: homeAppBar(ref) ,
      body: RefreshIndicator(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ) ,
                HelloText() ,
                const UserName(),
                SizedBox(
                  height: 20.0,
                ) ,
                searchBar() ,
                SizedBox(
                  height: 20,
                ),
                HomeBanner(ref:ref , controller:_controller ) ,
                HomeMenuBar(),
                CourseItemGred(ref:ref) ,

              ],
            ),
          ),
        ),
        onRefresh: (){
     return     ref.refresh(homeCourseListProvider.notifier).fetchCourseList();
        },
      )
    );
  }
}
