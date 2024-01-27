import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/routs/routes.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/services/storage.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';
import 'firebase_options.dart';


   Future<void> main()  async {

  // WidgetsFlutterBinding.ensureInitialized() ;
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

     var person= Person('ellol', 24) ;
  await Global.init()  ;

await HttpUtil().post(
  'api/login' ,
  queryParameters: {
    'name':'ellol' ,
    'email':'ellol.com'


  }
) ;
  runApp(const ProviderScope(child:MyApp()));

}

class Person {

     String name ;
     int age ;
     Person(this.name ,this.age) ;


}

final GlobalKey<NavigatorState>navKey=GlobalKey<NavigatorState>() ;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Global.storageService.setString(AppConstants.STORAGE_USER_PROFIEL_KEY, jsonEncode({
      'name':'ellol' ,
      'email':'ellol@gmail.com' ,
      'age':'24'
    })) ;
    Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345') ;

      // bool theFirst =  StorageService().getDeviceFirstOpen() ;
      // bool theFirstOne =  StorageService().isLogin() ;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appThemeData  ,
      routes: {

    '/':(context){

      // if(theFirst==true){
      //   if(theFirstOne==true){
      //     return Application() ;
      //   }
      //   else {
      //     return SignIn();
      //   }
      //
      // }else {
      //   return Welcome()  ;
      // }

     // return Welcome()  ;
      return Application() ;
    },
        '/signIn':(context)=>SignIn(),
        '/signUp':(context)=>SignUp(),
        '/application':(context)=> Application(),

      },
     // onGenerateRoute: (settings)=>AppPage.generatRouteSetting(settings) ,
    //  home:  Welcome(),
    );
  }
}
final appCount = StateProvider<int>((ref) {

  return 1 ;

} );
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) {
 ;


    int  count = ref.watch(appCount) ;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("riverpod App"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${ref.read(appCount)}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'one',
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context )=>SecondPage()   )) ;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_alt_rounded),
          ), FloatingActionButton(
            heroTag: 'secound',
            onPressed: (){
              ref.read(appCount.notifier).state++ ;
              count++ ;
              print(count.toString()) ;

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount) ;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '${count}' ,
          style: TextStyle(
            fontSize: 30.0 ,
          ),
        ),
      ),
    ) ;
  }
}
