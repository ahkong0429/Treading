import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:treading/model/code.dart';
import 'package:treading/model/data_request.dart';

/*
 * 错误拦截
 * Created by guoshuyu
 * on 2019/3/23.
 */
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new DataRequest(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
          false,
          Code.NETWORK_ERROR));
    }
    return options;
  }
}
