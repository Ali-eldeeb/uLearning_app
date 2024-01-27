import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfield.dart';
import 'package:ulearning_app/common/widgets/buttom_widget.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';

import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller ;
  @override
  void initState() {
    _controller =SignUpController(ref:ref ) ;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final regProvider =ref.watch(registerNotifierProvider) ;
    final loader = ref.watch(appLoaderProvider) ;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold (
          appBar:buildAppbar(
            text: 'Sign Up'
          ) ,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

               SizedBox(
                 height: 30.0,
               ),
                Center(child: text14Normal(
                    text:'Enter your details below & free sign up '
                )) ,
               SizedBox(
                 height: 50.0,
               ),
                appTextField(
                  text: 'User name' ,
                  iconName: ImageRes.user ,
                  hintText: 'Enter your user name' ,
                  func: (value) =>ref
                      .read(registerNotifierProvider.notifier)
                      .onUserNameChange(value) ,
                ) ,
                SizedBox(
                  height: 20.0,
                ), appTextField(
                  text: 'Email' ,
                  iconName: ImageRes.user ,
                  hintText: 'Enter your email address' ,

                  func: (value) =>ref
                      .read(registerNotifierProvider.notifier)
                      .onUserEmailChange(value) ,
                ) ,
                SizedBox(
                  height: 20.0,
                ),
                appTextField(
                  text: 'Password',
                    iconName: ImageRes.lock,
                  hintText: 'Enter your password' ,
                    func: (value) =>ref
                        .read(registerNotifierProvider.notifier)
                        .onUserPasswordChange(value) ,
                  obscureText: true
                ) , SizedBox(
                  height: 20.0,
                ),
                appTextField(
                  text: 'Conform rePassword',
                    iconName: ImageRes.lock,
                  hintText: 'Enter your Conform password' ,
                    func: (value) =>ref
                        .read(registerNotifierProvider.notifier)
                        .onUserRePasswordChange(value) ,
                  obscureText: true
                ) ,
                SizedBox(
                  height: 20.0,
                ),

                Container(
                    margin: EdgeInsets.only(
                      left: 25.0 ,
                      right: 25.0
                    ),

                    child: text14Normal(
                      text: 'By creating an account you are agreeing with terms and condition '
                    )) ,

                SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: appBottom(
                    buttonName: 'Register ' ,
                    isLogin: true ,
                    context: context,
                    func: ()=>_controller.handelSignUp()



                  ),
                ) ,




              ],
            ),
          ),
        ),
      ),
    );
  }
}
