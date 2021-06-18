import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'dio_interceptors/custom_interceptor.dart';

class CustomDIO extends DioForNative {
  final BaseOptions options;
  CustomDIO(this.options) : super(options) {
    interceptors.add(CustomInterceptors());
  }
}
