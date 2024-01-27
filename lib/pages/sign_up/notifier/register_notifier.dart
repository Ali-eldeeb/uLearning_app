
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/pages/sign_up/notifier/register_state.dart';
part 'register_notifier.g.dart';
@riverpod

class RegisterNotifier extends _$RegisterNotifier{


  @override
   RegisterState  build()
  {

    return RegisterState() ;
  }


  void onUserNameChange (String name){

    state=state.copyText(userName: name) ;
  }

 void onUserEmailChange (String email){

    state=state.copyText(email: email) ;
  }

 void onUserPasswordChange (String email){

    state=state.copyText(email: email) ;
  }
 void onUserRePasswordChange (String email){

    state=state.copyText(email: email) ;
  }




}
