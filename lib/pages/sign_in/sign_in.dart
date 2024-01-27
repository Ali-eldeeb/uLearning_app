import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_textfield.dart';
import 'package:ulearning_app/common/widgets/buttom_widget.dart';
import 'package:ulearning_app/common/widgets/text_widget.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/sign_up/sign_up_controller.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {


  late SignInController _controller ;
  @override
  void initState() {
Future.delayed(Duration(seconds: 0),(){
  _controller =SignInController(ref ) ;
}) ;

    // TODO: implement initState
    super.initState();
  }
  @override
  void didChangeDependencies() {
   // Future.delayed(Duration(seconds: 0),(){
      _controller =SignInController(ref ) ;
    //}) ;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {

    final signInProvider =ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold (
          appBar:buildAppbar() ,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  thiredPartyLogin() ,
                  Center(child: text14Normal(text:'Or use your email account to login' )) ,
                 SizedBox(
                   height: 50.0,
                 ),
                  appTextField(
                    controller: _controller.emailController ,
                    text: 'Email' ,
                    iconName: ImageRes.user ,
                    hintText: 'Enter ypor email address',

                  ) ,
                  SizedBox(
                    height: 20.0,
                  ),
                  appTextField(
                    controller: _controller.passwordController,
                    text: 'Password',
                      iconName: ImageRes.lock,
                    hintText: 'Enter your password' ,
                    obscureText: true
                  ) ,
                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                      margin: EdgeInsets.only(
                        left: 25.0
                      ),

                      child: textUnderLine(
                        text: 'Forget Password?'
                      )) ,
                  SizedBox(
                    height: 100.0,
                  ),
                  Center(
                    child: appBottom(
                      buttonName: 'Log In' ,
                      context: context ,
                      func: ()=> _controller.hundelSignIn()  ,



                    ),
                  ) ,
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: appBottom(
                      buttonName: 'Register ' ,
                      isLogin: false ,
                      context: context ,

                        func: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>SignUp()));
                        }

                    ),
                  ) ,




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
