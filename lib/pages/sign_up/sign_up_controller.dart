

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_massage.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_notifier.dart';
import 'package:ulearning_app/pages/sign_up/repo/sign_up_repo.dart';

class SignUpController {

  late WidgetRef ref  ;

  SignUpController({
    required this.ref
}) ;

  TextEditingController emailController =TextEditingController() ;
  TextEditingController passwordController =TextEditingController() ;

Future < void> handelSignUp () async {

    var state =ref.read(registerNotifierProvider);

    String password =state.password ;
    String email = state.email ;

    emailController.text =email ;
    passwordController.text =password ;



    print('your name is ${password}') ;
    print('your email is ${email}') ;

    if(state.email.isEmpty||email.isEmpty){
      toastInfo(
          'your email is empty '
      );
      return;

    }

    // if(state.password.isEmpty||password.isEmpty){
    //   toastInfo(
    //       'your password is empty '
    //   );
    //   return;
    //
    // }




    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
Future.delayed(Duration(seconds: 2),()async
{
  var context =Navigator.of(ref.context) ;


  try{
    final credential = await SignUpRepo.firebaseSignIn(email, password) ;
    if(kDebugMode){
      print(credential);
    }
      if(credential.user!=null)   {
      await credential.user?.sendEmailVerification();
    // await credential.user?.updateDisplayName(name);
      String photoUrl ='upload/defaults.png' ;
       await credential.user?.updateDisplayName(photoUrl);

      toastInfo(
        'an email has been to verify your account please open the email and confirm your identify  '
      );
      print('an email has been to verify your account please open the email and confirm your identify  ');
     context.pop() ;


    }

  }
  on FirebaseAuthException catch(e){

   if(e.code =='weak-password'){
     toastInfo('the password is too weak') ;
   }else if(e.code=='email-already-in-use'){
     toastInfo('this email address has already been registered') ;
   }
  // print('el eroor nuber two ${e.code}') ;

  }
  catch(e){

    if(kDebugMode)
    print('kosmin om el error el error is ${e.toString()}') ;

  }




  ref.watch(appLoaderProvider.notifier).setLoaderValue(false) ;

});


  }



}