class SignInState {

  final String email ;
  final String password ;


  SignInState({
    this.email='' ,
    this.password='' ,

  }) ;


  SignInState copyText (
      {
        String ? email ,
        String? password ,})
  {
    return SignInState(
        email:email ??this.email ,
        password: password ??this.password ,
    ) ;
  }




  void main(){

    SignInState state = SignInState() ;
 



  }




}