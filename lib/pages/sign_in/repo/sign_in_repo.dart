import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/services/http_util.dart';


class SignInRepo {

static Future<UserCredential> firebaseSignIn(
      String email ,
      String password ,
      ) async {
    final credential =  await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password ,
    ) ;
    return credential ;
  }



  static Future<UserLoginResponseEntity> login({LoginRequestEntity ? parmes}) async {

  var response = await HttpUtil().post(
    'api/login' ,
   queryParameters: parmes?.toJson()

  ) ;
  return UserLoginResponseEntity.fromJson(response) ;

  }

}
