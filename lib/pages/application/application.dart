import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/pages/application/notifier/application_nav_notifier.dart';
import 'package:ulearning_app/pages/application/widget/widgets.dart';

class Application extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {

int index = ref.watch(applicationNavIndexProvider);
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              body: appScreens(index: index),
              bottomNavigationBar:Container(
                width: 375.0,
                height: 58.0,
                decoration: appBoxShadowWithRadius(),
                child: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value){
                   ref.read(applicationNavIndexProvider.notifier).changeIndex(value);

                  },
                  elevation: 0,
                  items: bottomTabs,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourElementText,
                ),
              ) ,
            )
        )
    );
  }}
