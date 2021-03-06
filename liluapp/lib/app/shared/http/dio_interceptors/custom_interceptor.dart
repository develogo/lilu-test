import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // print(
    //     'RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // print('ERROR[${err.response?.statusCode}] => PATH: ${err.request.path}');
    return super.onError(err, handler);
  }
}
