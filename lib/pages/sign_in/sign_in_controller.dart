

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/popup_massage.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

import 'package:ulearning_app/pages/sign_in/repo/sign_in_repo.dart';

class SignInController{

  WidgetRef ref ;
  SignInController(this.ref ) ;
  TextEditingController emailController =TextEditingController() ;
  TextEditingController passwordController =TextEditingController() ;


  void hundelSignIn(){

    var state = ref.read(signInNotifierProvider)  ;
    String email =state.email ;
    String password =state.password ;




  }



  Future < void> handelSignUp () async {

    var state =ref.read(signInNotifierProvider);



    String email = state.email ;
    String password = state.password ;
    emailController.text =email ;
    passwordController.text =password ;



    print('your email is ${email}') ;
    print('your password is ${password}') ;






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

    // ref.read(signInNotifierProvider.notifier).setLoaderValue(true);


    Future.delayed(Duration(seconds: 2),()async
    {
      var context =Navigator.of(ref.context) ;
      ref.read(appLoaderProvider.notifier).setLoaderValue(true) ;
      try{
        final credential =await SignInRepo.firebaseSignIn(email, password)  ;
        if(kDebugMode){
          print(credential);
        }
        if(credential.user==null)   {
          toastInfo('User not found');
        }
        if(credential.user!.emailVerified){
          toastInfo('you must verfiy your email') ;
        }

        var user=credential.user;
        if(user!=null){

          String?disaplayName = user.displayName;
          String?emai = user.email;
          String?id = user.uid ;
          String?photoUrl = user.photoURL ;


          LoginRequestEntity loginRequestEntity = LoginRequestEntity() ;

          loginRequestEntity.avatar = photoUrl  ;
          loginRequestEntity.name =disaplayName ;
          loginRequestEntity.email=email ;
          loginRequestEntity.open_id = id ;
          loginRequestEntity.type =1 ;
          asyncPostAllData(loginRequestEntity) ;
          print('user log in ') ;

        }else
        {
          toastInfo('Login error') ;
        }



      }
      on FirebaseAuthException catch(e){

        if(e.code =='user-note-found'){
          toastInfo('user not found') ;
        }else if(e.code=='wrong-password'){
          toastInfo('your password is wrong') ;
        }
        print(e.code) ;

      }
      catch(e){


          print(' el error is ${e.toString()}') ;

      }




      ref.watch(appLoaderProvider.notifier).setLoaderValue(false) ;

    });


  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // ref.watch(appLoaderProvider.notifier).setLoaderValue(true) ;
    // ref.watch(appLoaderProvider.notifier).setLoaderValue(false) ;
    var result =await SignInRepo.login(
      parmes: loginRequestEntity
    ) ;
    if(result.code==200){


      try{
        var navigator = Navigator.of(ref.context) ;
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFIEL_KEY,jsonEncode(result.data)) ;
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!) ;
        // navigator.pushNamedAndRemoveUntil(newRouteName, (route) => false)
        navigator.push(MaterialPageRoute(
            builder:(BuildContext context)=>
                Application()));

      }catch(e){
        print(e.toString());

      }

    }else {
      toastInfo('login error');
    }

  }

}