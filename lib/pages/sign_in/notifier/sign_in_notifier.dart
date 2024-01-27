
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sing_in_state.dart';
class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super (SignInState()) ;


  void onUserEmailChange (String email){

    state=state.copyText(email: email) ;
  }

  void onUserPasswordChange (String password){

    state=state.copyText(password: password) ;
  }


}

final signInNotifierProvider = StateNotifierProvider
<SignInNotifier,SignInState>((ref) => SignInNotifier());