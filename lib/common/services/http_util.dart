import 'package:dio/dio.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil{

  late Dio dio ;
  static final HttpUtil _instance= HttpUtil._internal() ;

  factory HttpUtil(){

    return _instance ;
  }
  HttpUtil._internal(){

   BaseOptions options =  BaseOptions(
baseUrl: AppConstants.SERVER_API_URL ,
      connectTimeout: const Duration(seconds: 5) ,
      receiveTimeout: const Duration(seconds: 5) ,
      headers: {} ,
      contentType:  "application/json:charset= utf_8" ,
      responseType: ResponseType.json ,
) ;
   dio=Dio(options);
   dio.interceptors.add(InterceptorsWrapper(
       onRequest: (options,handler){
       return handler.next(options);
     } ,
     onResponse: (responce , handler){
       return handler.next(responce);
       } ,
     onError: (DioException e ,handler ){
         ErrorEntity eInfo=createErrorEntity(e);
         onError(eInfo);
         return handler.next(e) ;
     }
   ));


  }


  Map<String,dynamic>? getAuthorizationHeader(){
    var headers= <String ,dynamic >{} ;
    var accessToken = Global.storageService.getUserToken()  ;
    if (accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer ${accessToken}' ;
    }

    return headers ;

  }


 Future post (String path ,{
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  })
  async {
    Options requestOption =options??Options() ;
    Map<String,dynamic>?authorization = getAuthorizationHeader() ;
    if ( authorization!=null){
      requestOption.headers!.addAll(authorization);
    }

    requestOption.headers=requestOption.headers??{};
  var response = await dio.post(
      path,
    queryParameters: queryParameters ,
      data: data ,
      options: requestOption
    ) ;
  return response.data ;

  }


}


class ErrorEntity implements Exception {
  int code =-1 ;
  String message='' ;
  ErrorEntity({
    required this.code,
    required this.message,
}) ;

  String toString(){
    if(message==null) return 'Exception' ;

    return 'Exception code $code , $message' ;

  }


}


 ErrorEntity createErrorEntity(DioException error ){
  switch(error.type){
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'connection time out') ;
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'send time out') ;
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'receive time out') ;
      // TODO: Handle this case.
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'badCertificate') ;
      // TODO: Handle this case.
    case DioExceptionType.badResponse:
      print('bad responce ') ;
      switch (error.response!.statusCode){
        case 400:
          return ErrorEntity(code: 400, message: 'request syntax error ') ;
          case 401:
          return ErrorEntity(code: 401  , message: 'permission denied ') ;

      }
      return ErrorEntity(code: -1, message: 'Bad SSL certificates') ;

      // TODO: Handle this case.
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: 'server cancel it') ;
      // TODO: Handle this case.
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'connectionError') ;
      // TODO: Handle this case.
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'unknown error') ;

  // TODO: Handle this case.
  }

}

void onError(ErrorEntity eInfo)
 {

   print('error->${eInfo.code},error.message->${eInfo.message}') ;
   switch(eInfo.code){
     case 400:
       print('server syntax error') ;
       break; case 401:
       print('your are denied to Countainer ') ;
       break;
       case 500:
       print('Internal server error') ;
       break ;
     default :
       print('Unknown') ;
       break ;


   }


}


